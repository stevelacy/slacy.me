{component, DOM, Link} = require 'fission'
{div, li, a} = DOM

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
  contact: ->
    window.scrollTo 0, 4000
    @close()
  home: ->
    window.scrollTo 0, 0
    @close()
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
          Link
            onClick: @home
            to: '/',
            li null, 'HOME'
          a
            onClick: @close
            target: '_blank'
            href: 'https://github.com/stevelacy',
            li null, 'PROJECTS'
          div
            onClick: @contact
            li null, 'CONTACT'

