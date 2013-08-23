define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class Photos extends Model
    urlRoot:"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=8149a9878e671cb348c812cdc0f26cc2&tags=cat&format=json&nojsoncallback=1&api_sig=4aa5a9c44b82dd3f27a642d5c771d56a"

    defaults:
      message: 'ey!'
