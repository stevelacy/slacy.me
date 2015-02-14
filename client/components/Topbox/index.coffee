{component, DOM} = require 'fission'
{div, img} = DOM

module.exports = component
  displayName: 'Topbox'
  render: ->
    div
      className: 'component topbox',
      style:
        background: "#171717 url(#{@props.image})"
        backgroundSize: 'cover'
        backgroundPosition: 'center'
      img src: '/images/diamond_l.png'
