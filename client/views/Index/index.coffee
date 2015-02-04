{DOM, view} = require 'fission'
{div} = DOM

module.exports = view
  displayName: 'Index'
  render: ->
    div
      className: 'component index'
    , 'Index'
