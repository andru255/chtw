define [
  'views/base/view'
  'text!templates/photo/photo-page.hbs'
], (View, template) ->

  class PhotoPageView extends View
    template: template
    container: '#photo-container'
    autorender: yes
    events:
      'click #detalle': 'verDetalle'
    listen:
      'change model': 'render'

    render:->
      @publishEvent '!adjustHeaderTitle', @model.get('name') || 'Photos'
      super

    verDetalle:->
      console.log 'ver detalle..'
