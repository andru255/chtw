define [
  'config'
  'chaplin'
  'controllers/base/controller'
  'models/base/collection'
  'models/photo'
  'models/photo-detail'
  'models/photo-comment'
  'views/photo-page-view'
  ], (Config, Chaplin, Controller, Collection, Photo, PhotoDetail, PhotoComment, PhotoPageView)->
  'use strict'

  class HomeController extends Controller
    show:(params)->
      console.log 'show'

    photo:(params)->
      console.log params
      id = params.id
      if id
        photoDetail = new Photo
          urlRoot: Config.detailPhoto(id)

        photoComments = new Collection null, PhotoComment
        photoComments.url = Config.urlComments(id)

        @photoDetailView = new PhotoPageView
          collection: photoComments
          region: 'rightSide'

        photoComments.fetch().then =>
          console.log @photoDetailView
