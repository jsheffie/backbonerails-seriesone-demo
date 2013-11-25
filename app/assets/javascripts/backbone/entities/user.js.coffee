@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.User extends Entities.Model

  class Entities.UsersCollection extends Entities.Collection
    #url: "users"
    url: Routes.users_path()
    model: Entities.User

  API =
    setCurrentUser: ( currentUser ) ->
      new Entities.User currentUser
      
    getUserEntities: ->
      users = new Entities.UsersCollection
      #users.fetch( )
      users.fetch(reset: true) # Hack to get numbers to work.( panel collection)
      users
          
  App.reqres.setHandler "set:current:user", (currentUser) ->
    API.setCurrentUser currentUser

  App.reqres.setHandler "get:user:entities", ->
    API.getUserEntities()
    