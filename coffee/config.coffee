define ->

  Config =
    methodList: 'YQL'
    #YQL para la lista
    tagYQL: "Freddie Mercury"
    urlListYQL: ->
      "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20flickr.photos.info%20where%20api_key%3D%2200e7c797ab6d610f68170bdf33d06e2a%22%20and%20photo_id%20in%20(select%20id%20from%20flickr.photos.search%20where%20tags%3D%22#{this.tagYQL}%22%20and%20api_key%3D%2200e7c797ab6d610f68170bdf33d06e2a%22)&format=json&diagnostics=true&callback="
    #via flickr
    urlList: "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=51a3ea97719fa4df3c5a6d44e9bf7bb1&tags=cat&format=json&nojsoncallback=1"
    #token flickr
    token:
      "00e7c797ab6d610f68170bdf33d06e2a"
    #http://www.flickr.com/services/api/explore/flickr.photos.getInfo
    detailPhoto:(id)->"http://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=5e513fce488b297edec20b8d39833888&photo_id=#{id}&secret=#{Config.token}&format=json&nojsoncallback=1"
    #http://www.flickr.com/services/api/explore/flickr.photos.comments.getList
    urlComments:(id)->    "http://api.flickr.com/services/rest/?method=flickr.photos.comments.getList&api_key=5e513fce488b297edec20b8d39833888&photo_id=#{id}&format=json&nojsoncallback=1"
