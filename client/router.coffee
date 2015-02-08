{router} = require 'fission'
Index = require './views/Index'
About = require './views/About'
Application = require './views/Application'

module.exports = router
  app:
    path: '/'
    view: Application
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
      index:
        view: Index
        default: true
