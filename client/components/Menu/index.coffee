{component, DOM, Link} = require 'fission'
{div, li, a} = DOM

MenuButton = require '../MenuButton'

module.exports = component
  mounted: ->
    if @isMounted()
      document.onkeyup = (e) =>
        if e.keyCode == 27
          @close()
  contact: ->
    window.scrollTo 0, 4000
    @close()
  home: ->
    window.scrollTo 0, 0
    @close()
  close: ->
    @props.onClose()

  render: ->
    div
      className: "menu component"
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

