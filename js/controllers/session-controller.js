// Generated by CoffeeScript 1.6.3
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['controllers/base/controller', 'models/user', 'views/login-view', 'lib/services/chtw'], function(Controller, User, LoginView, Chtw) {
  var SessionController, _ref;
  return SessionController = (function(_super) {
    __extends(SessionController, _super);

    function SessionController() {
      this.logout = __bind(this.logout, this);
      this.serviceProviderSession = __bind(this.serviceProviderSession, this);
      this.triggerLogin = __bind(this.triggerLogin, this);
      _ref = SessionController.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    SessionController.serviceProviders = {
      chtw: new Chtw()
    };

    SessionController.prototype.loginStatusDetermined = false;

    SessionController.prototype.loginView = null;

    SessionController.prototype.ServiceProviderName = null;

    SessionController.prototype.initialize = function() {
      this.suscribeEvent('serviceProviderSession', this.serviceProviderSession);
      this.suscribeEvent('logout', this.logout);
      this.suscribeEvent('userData', this.userData);
      this.suscribeEvent('!showLogin', this.showLoginView);
      this.suscribeEvent('!login', this.triggerLogin);
      this.suscribeEvent('!logout', this.triggerLogout);
      return this.getSession();
    };

    SessionController.prototype.loadServiceProviders = function() {
      var name, serviceProvider, _ref1, _results;
      _ref1 = SessionController.serviceProviders;
      _results = [];
      for (name in _ref1) {
        serviceProvider = _ref1[name];
        _results.push(serviceProvider.load());
      }
      return _results;
    };

    SessionController.prototype.createUser = function() {
      return Chaplin.mediator.user = new User(userData);
    };

    SessionController.prototype.getSession = function() {
      var name, serviceProvider, _ref1, _results;
      this.loadServiceProviders();
      _ref1 = SessionController.serviceProviders;
      _results = [];
      for (name in _ref1) {
        serviceProvider = _ref1[name];
        _results.push(ServiceProvider.done(serviceProvider.getLoginStatus));
      }
      return _results;
    };

    SessionController.prototype.showLoginView = function() {
      if (this.loginView) {
        return;
      }
      this.loadServiceProviders();
      return this.loginView = new LoginView({
        serviceProviders: SessionController.serviceProviders
      });
    };

    SessionController.prototype.triggerLogin = function(serviceProviderName) {
      var serviceProvider;
      serviceProvider = SessionController.serviceProviders[serviceProviderName];
      if (!serviceProvider.isLoaded()) {
        this.publishEvent('serviceProviderMissing', serviceProviderName);
        return;
      }
      this.publishEvent('loginAttempt', serviceProviderName);
      return serviceProvider.triggerLogin();
    };

    SessionController.prototype.serviceProviderSession = function(session) {
      this.serviceProviderName = session.provider.name;
      this.disposeLoginView();
      session.id = session.userId;
      delete session.userId;
      this.createUser(session);
      return this.publishLogin();
    };

    SessionController.prototype.publishLogin = function() {
      this.loginStatusDetermined = true;
      this.publishEvent('login', Chaplin.mediator.user);
      return this.publishEvent('loginStatus', true);
    };

    SessionController.prototype.triggerLogout = function() {
      return this.publishEvent('logout');
    };

    SessionController.prototype.logout = function() {
      this.loginStatusDetermined = true;
      this.disposeUser();
      this.serviceProviderName = null;
      this.showLoginView;
      return this.publishEvent('loginStatus', false);
    };

    SessionController.prototype.userData = function(data) {
      return Chaplin.mediator.user.set(data);
    };

    SessionController.prototype.disposeLoginView = function() {
      if (!this.loginView) {
        return;
      }
      this.loginView.dispose();
      return this.loginView = null;
    };

    SessionController.prototype.disposeUser = function() {
      if (!Chaplin.mediator.user) {
        return;
      }
      Chaplin.mediator.user.dispose();
      return Chaplin.mediator.user = null;
    };

    return SessionController;

  })(Controller);
});