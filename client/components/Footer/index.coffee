{component, DOM} = require 'fission'
{div, a} = DOM

year = new Date().getFullYear()

module.exports = component
  render: ->
    div className: 'component footer',

      a
        className: 'text'
        href: 'https://twitter.com/steve_lacy'
        target: '_blank'
      , '@steve_lacy'


      a
        className: 'text'
        href: 'mailto:me@slacy.me'
      , 'me@slacy.me'
      div className: 'copy', "© #{year} slacy.me"
