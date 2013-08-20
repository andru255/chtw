define [
  'views/base/collection-view'
  'views/photo-item-view'
], (CollectionView, PhotoItemView) ->

  class PhotosCollectionView extends CollectionView
    tagName: 'ul'
    id: 'photosList'
    className: 'list'
    itemView: PhotoItemView
    autoRender: true
