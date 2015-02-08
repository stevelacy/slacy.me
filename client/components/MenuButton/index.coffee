{component, DOM} = require 'fission'
{div, button} = DOM

module.exports = component
  init: ->
    o =
      top: null
      middle: null
      bottom: null

  mounted: ->
    if @props.state == 'open'
      @setAnimation()
  toggleMenu: ->
    @props.toggleMenu()
    return @setState top: null, middle: null, bottom: null unless !@state.top
    @setAnimation()
    setTimeout =>
      @setState
        top: null
        middle: null
        bottom: null
    , 500

  setAnimation: ->
    @setState
      top:
        transformOrigin: 'top left'
        transform: 'rotate(45deg)'
      middle:
        opacity: 0
      bottom:
        transform: 'rotate(-45deg)'
        transformOrigin: 'bottom left'
  render: ->

    button
      className: "menubutton component #{@props.color}"
      onClick: @toggleMenu
      ,
        div
          className: 'bar top'
          style: @state.top
        div
          className: 'bar middle'
          style: @state.middle

        div
          className: 'bar bottom'
          style: @state.bottom
