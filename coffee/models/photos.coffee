define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class Photos extends Model
    urlRoot:"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=7d84a9ffdf7d39e9f86da709ae558cbf&tags=cat&format=json&nojsoncallback=1&api_sig=d30962aea5ca5d819cb7eda96f21f7a3"

    #parse:(response)->
      #console.log "entra aqui"
      #console.log response
      #return response.photos.photo

