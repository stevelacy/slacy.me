{view, DOM} = require 'fission'
{div} = DOM

module.exports = view
  render: ->
    div className: 'view notfound',
      div className: 'content',
        div className: 'box',
          div className: 'align',
            div className: 'message header', '404 not found'
