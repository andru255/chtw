define [
  'controllers/base/controller'
  'models/user'
  'views/login-view'
  'lib/services/chtw'
],(Controller, User, LoginView, Chtw)->

  class SessionController extends Controller
    #servicio proveedor de instancias como propiedades estáticas
    #Esto es sólo harcodeado aqui para evitar carga asíncrona de proveedores de
    #servicio.

    @serviceProviders = {
      chtw: new Chtw()
    }

    # cuando el login status ha sido determinado?
    loginStatusDetermined: false

    #Este controller gobernará sobre LoginView
    loginView: null

    #Actual proveedor de Servicio
    ServiceProviderName: null

    initialize:->
      #login flow events
      @suscribeEvent 'serviceProviderSession', @serviceProviderSession

      #manejando el login
      @suscribeEvent 'logout', @logout
      @suscribeEvent 'userData', @userData

      # Manejador de eventos con cada trigger en acción
      #Mostrar el dialogo de login
      @suscribeEvent '!showLogin', @showLoginView
      #Intentar loguearse con un proveedor de servicio
      @suscribeEvent '!login', @triggerLogin
      #Iniciando el logout
      @suscribeEvent '!logout', @triggerLogout

      #Determinador del stado del logeo
      @getSession()

    #cargando las librerías de todos los proveedores de servicio
    loadServiceProviders:->
      for name, serviceProvider of SessionController.serviceProviders
        serviceProvider.load()

    #Instanciando el usuario con la data dada
    createUser:->
      Chaplin.mediator.user = new User userData

    #Tomando una sesion existente desde uno de los proveedores del login
    getSession:->
      @loadServiceProviders()
      for name, serviceProvider of SessionController.serviceProviders
        ServiceProvider.done serviceProvider.getLoginStatus

    #Manejador para el global !showLoginView event
    showLoginView: ->
      return if @loginView
      @loadServiceProviders()
      @loginView = new LoginView
        serviceProviders: SessionController.serviceProviders

    #Manejador para el global !login event
    #Delegando el login para el seleccionado proveedor de servicio
    triggerLogin: (serviceProviderName) =>
      serviceProvider = SessionController.serviceProviders[serviceProviderName]

      #Publicando un evento en caso la librería del proveedor no a cargado
      unless serviceProvider.isLoaded()
        @publishEvent 'serviceProviderMissing', serviceProviderName
        return

      # Publicando un global loginAttempt event
      @publishEvent 'loginAttempt', serviceProviderName

      #Delegate to service provider
      serviceProvider.triggerLogin()

    #Manejador para el global serviceProviderSession event
    serviceProviderSession: (session)=>
      #Guardando la session del proveedor usado para el login
      @serviceProviderName = session.provider.name

      #Ocultando la vista del login
      @disposeLoginView()

      #Transformando la session en atributos de usuario y crear el usuario
      session.id = session.userId
      delete session.userId
      @createUser session

      @publishLogin()

    #Publicar un evento para notificar a todos los componentes de la aplicacion
    #para el login
    publishLogin: ->
      @loginStatusDetermined = true

      #Publicando un global login event pasando el user
      @publishEvent 'login', Chaplin.mediator.user
      @publishEvent 'loginStatus', true

    #Logout
    #------

    #Manejador para el global !logout event
    triggerLogout: ->
      #Solo publicar un logout event por ahora
      @publishEvent 'logout'

    #Manejador para el global logout event
    logout:=>
      @loginStatusDetermined = true

      @disposeUser()

      #Deshacer la info del login
      @serviceProviderName = null

      #Mostrando de nuevo la vista de login
      @showLoginView

      @publishEvent 'loginStatus', false

    #Manejador para el global userData event
    #----------------------------------------

    userData:(data)->
      Chaplin.mediator.user.set data

    #Disposal
    #--------

    disposeLoginView:->
      return unless @loginView
      @loginView.dispose()
      @loginView = null

    disposeUser:->
      return unless Chaplin.mediator.user
      #Disponer el user model
      Chaplin.mediator.user.dispose()
      #Nullificando la propiedad del mediator
      Chaplin.mediator.user = null


