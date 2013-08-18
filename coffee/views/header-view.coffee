define [
  'views/base/view'
  'text!templates/header.hbs'
], (View, template) ->

  class HeaderView extends View
    ###
    autorender: true
    classname: 'header'
    id: 'header'
    region: 'header'
    tagName: 'header'
    template: template

    listen:
      'loginStatus mediator': 'render'
    ###
