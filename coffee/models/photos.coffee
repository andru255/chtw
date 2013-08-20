define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class Photos extends Model
    urlRoot:"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=100fdf7552196490a96bea6ae20d6096&tags=cat&format=json&nojsoncallback=1&api_sig=1ccc53d1cbea10e25098ad252502990c"

    defaults:
      message: 'ey!'

    parse:(response)->
      return response.photo

