@Demo = do (Backbone, Marionette) ->
  App = new Marionette.Application

  #App.rootRoute = "users"
  App.rootRoute = Routes.users_path()
    
  # I got passed in a user object ( from rails )
  App.on "initialize:before", ( options ) ->
    @currentUser = App.request "set:current:user", options.currentUser

  App.reqres.setHandler "get:current:user", ->
    App.currentUser
    
  App.addRegions
    headerRegion: "#header-region"
    mainRegion: "#main-region"
    footerRegion: "#footer-region"

  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("FooterApp").start()

    
        
  App.on "initialize:after", ( options ) ->
    if Backbone.history
      Backbone.history.start()
      @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""
      #Backbone.history.navigate "users" if Backbone.history.fragement is ""

  App
