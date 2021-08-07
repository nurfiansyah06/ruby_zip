require_relative '../models/user'
require 'json'

class UserController
    def get_all_users
        users = User.get_all_users
        users.to_json
    end

    def insert_user(params)
        user = User.new(params)
        user.save_user
        return user.save_user.to_json
    end
end