{DOM, view} = require 'fission'
{div} = DOM

module.exports = view
  displayName: 'About'
  render: ->
    div className: 'view about',
      div className: 'content',
        div className: 'box',
          'About'
          div className: 'statement',
            'TEST'
