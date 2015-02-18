{router} = require 'fission'
Application = require './views/Application'
Index = require './views/Index'
NotFound = require './views/NotFound'

module.exports = router
  app:
    path: '/'
    view: Application
    defaultChild:
      view: Index
    childNotFound:
      view: NotFound
