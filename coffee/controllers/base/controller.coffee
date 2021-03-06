define [
    'config'
    'chaplin'
    'views/site-view'
    'views/header-view'
    'models/base/collection'
    'models/photo'
    'views/photos-collection-view'
  ], (Config, Chaplin, SiteView, HeaderView, Collection, Photo, PhotosCollectionView) ->
    'use strict'

    class Controller extends Chaplin.Controller
      # Place your application-specific controller features here
      beforeAction:(params, route)->
        @compose 'site', SiteView
        @compose 'header', HeaderView

        #List of photos
        @compose 'navigation', ->
          @photos = new Collection null, model: Photo

          @photos.url = if Config.methodList is 'YQL' then Config.urlListYQL() else Config.urlList

          @photos.parse = (response)->

            if Config.methodList == 'YQL'
              response.query.results.photo
            else
              response.photos.photo

          @photosView = new PhotosCollectionView
            collection:@photos
            region:'leftSide'

          @photos.fetch()


