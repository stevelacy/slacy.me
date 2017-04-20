{DOM, view} = require 'fission'
{div, span, br, a} = DOM

Topbox = require '../../components/Topbox'

module.exports = view
  displayName: 'Index'
  init: ->
    box: null

  mounted: ->
    window.onscroll = =>
      if window.pageYOffset > 200
        return unless @isMounted()
        @setState box: 'animated'

  render: ->
    div
      className: 'index view'

      Topbox
        image: '/images/bg.jpg'
      div className: 'content',
        div className: "box animation #{@state.box}",
          div className: 'left blue',
            div className: 'statement bold', 'I SOLVE'

          div className: 'right dgrey',
            div className: 'statement',
              span className: 'emphasis', 'PROBLEMS'

        div className: 'box',
          div className: 'align',
            div className: 'message header', 'Steve Lacy'
            div className: 'message', 'Open source enthusiast'
            div className: 'message', 'Software engineer'
            br()
            div className: 'message',
              a
                target: '_blank'
                href: 'https://github.com/stevelacy'
                'github.com/stevelacy'

            div className: 'message',
              a
                target: '_blank'
                href: 'https://twitter.com/steve_lacy'
                'twitter.com/steve_lacy'
