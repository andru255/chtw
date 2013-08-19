define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class PhotosModel extends Model
    urlRoot:"http://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=afbc4a16eae358578189479ffae8c063&photo_id=cat&format=json&nojsoncallback=1&api_sig=65a41067f4e207282d023619e6a015a4"

    defaults:
      message: 'ey!'
