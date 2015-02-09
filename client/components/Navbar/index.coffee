{component, DOM, Link} = require 'fission'
{div, span, button} = DOM

module.exports = component
  mounted: ->
    window.onscroll = (e) ->
      console.log window.scrollY

  render: ->
    div className: 'component navbar',
      div className: 'logo'
      ,
        Link to: '/',
          span className: 'blue', 'S'
          '.LACY'
