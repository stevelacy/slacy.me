{DOM, view} = require 'fission'
Topbox = require '../../components/Topbox'

{div} = DOM

module.exports = view
  displayName: 'About'
  render: ->
    div className: 'view about',
      Topbox
        image: '/images/headphones.jpg'
      div className: 'content',
        div className: 'box',
          div className: 'statement',
            'ABOUT ME'
