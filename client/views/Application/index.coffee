{DOM, ChildView, view} = require 'fission'
{div, img} = DOM

Navbar = require '../../components/Navbar'
Menu = require '../../components/Menu'
MenuButton = require '../../components/MenuButton'
Footer = require '../../components/Footer'


module.exports = view
  displayName: 'Application'
  init: ->
    o =
      menu: false
      first: null
      second: null
      third: null
      line: null
      img: null
      display: 'block'
    return o

  closeMenu: ->
    @setState menu: false
  toggleMenu: ->
    @setState menu: !@state.menu

  mounted: ->
    document.title = 'S.Lacy'

    setTimeout =>
      @setState
        line: transform: 'translateY(-50%) scaleX(1)'
    , 500

    setTimeout =>
      @setState
        img: 'large'
        first: 'animated'
    , 1000

    setTimeout =>
      @setState
        second: 'animated'
    , 1200

    setTimeout =>
      @setState
        third: 'animated'
    , 1800

    setTimeout =>
      @setState
        display: 'none'
    , 2200
  render: ->
    div
      className: 'application view'
    ,
      div
        className: "loader fadeOut #{@state.third}"
        style: display: @state.display
      ,
        div className: "top fadeOutUpBig #{@state.second}"
        div
          className: "line fadeOut #{@state.second}"
          style: @state.line
        img
          className: "#{@state.img} #{@state.first}"
          src: '/images/diamond_s.png'
        div className: "bottom fadeOutDownBig #{@state.second}"


      Navbar()
      if @state.menu
        Menu
          onClose: @closeMenu
      MenuButton
        toggleMenu: @toggleMenu
      ChildView()
      Footer()
