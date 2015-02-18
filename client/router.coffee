{router} = require 'fission'
Application = require './views/Application'
Index = require './views/Index'
About = require './views/About'
NotFound = require './views/NotFound'

module.exports = router
  app:
    path: '/'
    view: Application
    defaultChild:
      view: Index
    children:
      about:
        view: About
        path: 'about'
      projects:
        view: About
        path: 'projects'
      contact:
        view: About
        path: 'contact'
