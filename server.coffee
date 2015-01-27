path = require 'path'
express = require 'express'

config = require './config'

require 'newrelic'

pages = config.pages

app = express()
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/views'
app.use express.static __dirname + '/static'

app.get '/', (req, res) ->
  res.render 'index', menu: config.menu, title: pages['index'].title

app.get '/:page', (req, res) ->
  page = pages[req.params.page] if pages[req.params.page]
  return res.render pages.notFound.view, {menu: config.menu, title: pages.notFound.title} unless page?
  res.render page.view,
    page: page
    menu: config.menu
    title: page.title

app.listen config.port
console.log "Server started on port: #{config.port}"
