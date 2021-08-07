require 'sinatra'
require_relative 'app/controllers/user_controller'
require_relative 'app/models/response'

get '/' do
    content_type :json
    controller = UserController.new
    controller.get_all_users
end

post '/user' do
    name = params["name"]
    email = params["email"]
    password = params["password"]
    bio = params["bio"]

    controller = UserController.new
    controller.insert_user({name: name, email: email, password: password, bio: bio})
end