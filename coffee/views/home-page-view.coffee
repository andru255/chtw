define [
  'views/base/page-view'
  'text!templates/home-page.hbs'
],(PageView, template)->

  'use strict'

  class HomePageView extends PageView
    autoRender: true
    template: template
