{component, DOM} = require 'fission'
{div} = DOM

module.exports = component
  render: ->
    div className: 'component navbar'
