define [
  'views/base/view'
  'text!templates/photo/photo-item.html'
], (View, template) ->

  class PhotoItemView extends View
    tagName: 'li'
    className: 'photo-item'
    template: template
