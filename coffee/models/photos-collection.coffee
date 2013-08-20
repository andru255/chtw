define [
  'chaplin'
  'models/base/collection'
  'models/photos'
], (Chaplin, Collection, Photos) ->
  'use strict'
  class PhotosCollection extends Collection
    model: Photos
