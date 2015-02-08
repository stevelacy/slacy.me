{component, DOM, Link} = require 'fission'
{div, li} = DOM

MenuButton = require '../MenuButton'

module.exports = component
  init: ->
    return animation: 'bounceInRight'
  mounted: ->
    if @isMounted()
      document.onkeyup = (e) =>
        if e.keyCode == 27
          @close()
    setTimeout =>
      @setState opacity: 1
    , 10
  close: ->
    @setState animation: 'bounceOutRight'
    setTimeout =>
      @props.onClose()
    , 500

  render: ->
    div
      className: "menu component #{@state.animation} animated"
    ,
      MenuButton
        toggleMenu: @close
        state: 'open'
        color: 'light'
      div
        className: 'items',
          Link to: '/', li null, 'HOME'
          Link to: 'about', li null, 'ABOUT'
          Link to: 'projects', li null, 'PROJECTS'
          Link to: 'contact', li null, 'CONTACT'

