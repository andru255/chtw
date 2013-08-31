define [
  'views/base/view'
], (View)->

  #esta clase se encargará de manejar el comportamiento cuando hay un cambio
  # en navegación, es parte de la persistencia de la bandeja de fotos
  class PageView extends View
    region:'main'

    #Es la funcion por defecto, sin embargo se reemplazará por las clases hijas
    #que llamen esta funcion
    getNavigationData:->
      {}

    render:->
      super
      @publishEvent 'navigation:change', @getNavigationData()
