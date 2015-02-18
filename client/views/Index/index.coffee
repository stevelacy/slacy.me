{DOM, view} = require 'fission'
{div, span} = DOM

Topbox = require '../../components/Topbox'

module.exports = view
  displayName: 'Index'
  init: ->
    box: null
  mounted: ->
    window.onscroll = =>
      console.log window.pageYOffset
      if window.pageYOffset > 200
        @setState box: 'animated'
  render: ->
    div
      className: 'index view'
    ,
      Topbox
        image: '/images/bg.jpg'
      div className: 'content',
        div className: "box #{@state.box}",
          div className: 'left blue',
            div className: 'statement',
              'I SOLVE'
          div className: 'right dgrey',
            div className: 'statement',
              span className: 'emphasis', 'PROBLEMS'
        div className: 'box',
