http = require 'http'
gulp = require 'gulp'
es = require 'ecstatic'

source     = require 'vinyl-source-stream'
buffer     = require 'vinyl-buffer'
coffeeify  = require 'coffeeify'
browserify   = require 'browserify'
watchify = require 'watchify'

gif = require 'gulp-if'
jade = require 'gulp-jade'
stylus = require 'gulp-stylus'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
plumber = require 'gulp-plumber'
reload = require 'gulp-livereload'

sourcemaps = require 'gulp-sourcemaps'
autoprefixer = require 'autoprefixer-stylus'

autowatch = require 'gulp-autowatch'

nib = require 'nib'

cssSupport = [
  'last 5 versions',
  '> 1%',
  'ie 8', 'ie 7',
  'Android 4',
  'BlackBerry 10'
]

# paths
paths =
  img: './client/img/**/*'
  coffee: './client/**/*.coffee'
  bundle: './client/index.coffee'
  stylus: './client/**/*.styl'
  jade: './client/**/*.jade'
  config: './server/config/*.json'

gulp.task 'server', (cb) ->
  port = 5000
  server = http.createServer es root: './'
  server.listen port, cb

# javascript
args =
  debug: true
  fullPaths: true
  cache: {}
  packageCache: {}
  extensions: ['.coffee']

bundler = watchify browserify paths.bundle, args
bundler.transform coffeeify

gulp.task 'coffee', ->
  bundler.bundle()
    .once 'error', (err) ->
      console.error err
    .pipe source 'index.js'
    .pipe buffer()
    .pipe sourcemaps.init
      loadMaps: true
    .pipe sourcemaps.write '.'
    .pipe gulp.dest './public'
    .pipe gif '*.js', reload()

# styles
gulp.task 'stylus', ->
  gulp.src paths.stylus
    .pipe sourcemaps.init()
    .pipe stylus
      use:[
        nib()
        autoprefixer cascade: true
      ]
    .pipe sourcemaps.write()
    .pipe concat 'app.css'
    .pipe gulp.dest './public'
    .pipe reload()

gulp.task 'jade', ->
  gulp.src paths.jade
    .pipe jade()
    .pipe gulp.dest './public'
    .pipe reload()

gulp.task 'vendor', ->
  gulp.src paths.vendor
    .pipe gulp.dest './public/vendor'
    .pipe reload()

gulp.task 'img', ->
  gulp.src paths.img
    .pipe gulp.dest './public/img'
    .pipe reload()

gulp.task 'fonts', ->
  gulp.src paths.fonts
    .pipe gulp.dest './public/fonts'
    .pipe reload()

gulp.task 'watch', ->
  autowatch gulp, paths


gulp.task 'css', ['stylus']
gulp.task 'js', ['coffee']
gulp.task 'static', ['jade', 'img']
gulp.task 'default', ['js', 'css', 'static', 'server', 'watch']


reload.listen()
