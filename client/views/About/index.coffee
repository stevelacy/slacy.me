{DOM, view} = require 'fission'
{div} = DOM

module.exports = view
  displayName: 'About'
  render: ->
    div
      className: 'component about'
    , 'About'
