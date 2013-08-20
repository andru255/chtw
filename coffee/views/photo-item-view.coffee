define [
  'views/base/view'
  'text!templates/photo/photo-item.hbs'
], (View, template) ->

  class PhotoItemView extends View
    template: template
    tagName: 'li'
    className: 'photo-item'
    autoRender: true
