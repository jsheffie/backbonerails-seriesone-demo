@Demo.module "UsersApp", ( UsersApp, App, Backbone, Marionette, $, _ ) ->
  # Do we want this module to be routeable... yes we do... people get /users/ they get this app.

  class UsersApp.Router extends Marionette.AppRouter
    appRoutes:
      "users" : "listUsers"

  API =
    listUsers: ->
      console.log "... listUsers..."
      UsersApp.List.Controller.listUsers()
      
  App.addInitializer ->
    new UsersApp.Router
      controller: API

