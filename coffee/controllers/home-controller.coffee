define [
  'controllers/base/controller',
  'views/home-page-view'
  ], (Controller, HomePageView)->
  'use strict'

  class HomeController extends Controller
    show:(params)->
      @view = new HomePageView
