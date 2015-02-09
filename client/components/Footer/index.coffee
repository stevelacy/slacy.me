{component, DOM} = require 'fission'
{div} = DOM

module.exports = component
  render: ->
    div className: 'component footer',
      div className: 'box', '@SteveDeLacy'
      div className: 'box', 'me@slacy.me'
