{view, DOM} = require 'fission'
{div} = DOM

module.exports = view
  render: ->
    div className: 'view notfound'
