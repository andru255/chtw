define [
  'views/base/view'
  'text!templates/site.html'
], (View, template) ->
  'use strict'

  class SiteView extends View
    container: 'body'
    id: 'site-container'
    regions:
      main: '#content-container'
      leftSide: '#leftside'
      rightSide: '#rightside'
    template: template
    template = null
