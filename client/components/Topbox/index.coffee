{component, DOM} = require 'fission'
{div, img} = DOM

module.exports = component
  displayName: 'Topbox'
  render: ->
    div
      className: 'component topbox',
        img src: '/images/diamond_l.png'
