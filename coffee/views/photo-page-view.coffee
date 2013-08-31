define [
  'views/base/view'
  'text!templates/photo/photo-page.html'
], (View, template) ->

  class PhotoPageView extends View
    autoRender: true
    template: template
    template = null
