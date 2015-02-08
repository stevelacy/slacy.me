{DOM, view} = require 'fission'
{div, span} = DOM

Topbox = require '../../components/Topbox'

module.exports = view
  displayName: 'Index'
  render: ->
    div
      className: 'index page'
    ,
      Topbox()
      div className: 'content',
        div className: 'box',
          div className: 'left blue',
            div className: 'statement',
              'I SOLVE'
          div className: 'right dgrey',
            div className: 'statement',
              span className: 'emphasis', 'PROBLEMS'
