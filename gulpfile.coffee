http = require 'http'
gulp = require 'gulp'
express = require 'express'

source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
coffeeify = require 'coffeeify'
browserify = require 'browserify'
watchify = require 'watchify'

gif = require 'gulp-if'
jade = require 'gulp-jade'
csso = require 'gulp-csso'
stylus = require 'gulp-stylus'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
reload = require 'gulp-livereload'
replace = require 'gulp-replace'
plumber = require 'gulp-plumber'
autowatch = require 'gulp-autowatch'
autoprefixer = require 'gulp-autoprefixer'

nib = require 'nib'

cssSupport = [
  'last 5 versions',
  '> 1%',
  'ie 8',
  'ie 7',
  'ie 6',
  'Android 4',
  'BlackBerry 10'
]

# paths
paths =
  images: './client/images/**/*'
  coffee: './client/**/*.coffee'
  bundle: './client/index.coffee'
  stylus: './client/**/*.styl'
  jade: './client/**/*.jade'
  config: './server/config/*.json'
  fonts: './client/fonts/*'

gulp.task 'server', (cb) ->
  app = express()
  app.use express.static "#{__dirname}/public"
  app.get '/*', (req, res) ->
    res.sendFile "#{__dirname}/public/index.html"
  app.listen 5000

# javascript
args =
  debug: true
  fullPaths: false
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
    .pipe uglify()
    .pipe gulp.dest './public'
    .pipe gif '*.js', reload()

# styles
gulp.task 'stylus', ->
  gulp.src paths.stylus
    .pipe stylus
      use:[
        nib()
      ]
    .pipe autoprefixer browsers: cssSupport
    .pipe concat 'app.css'
    .pipe csso()
    .pipe gulp.dest './public'
    .pipe reload()

gulp.task 'jade', ->
  gulp.src paths.jade
    .pipe jade()
    .pipe replace 'CACHE_BUST', Math.random()
    .pipe gulp.dest './public'
    .pipe reload()

gulp.task 'vendor', ->
  gulp.src paths.vendor
    .pipe gulp.dest './public/vendor'
    .pipe reload()

gulp.task 'images', ->
  gulp.src paths.images
    .pipe gulp.dest './public/images'
    .pipe reload()

gulp.task 'fonts', ->
  gulp.src paths.fonts
    .pipe gulp.dest './public/fonts'
    .pipe reload()

gulp.task 'watch', ->
  autowatch gulp, paths


gulp.task 'css', ['stylus']
gulp.task 'js', ['coffee']
gulp.task 'static', ['jade', 'images']
gulp.task 'default', ['js', 'css', 'static', 'server', 'watch', 'fonts']


reload.listen()
