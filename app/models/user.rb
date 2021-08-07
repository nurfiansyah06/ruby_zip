require_relative '../config/db_connector'
require_relative 'response'

class User
    attr_reader :id, :email, :password, :bio

    def initialize(params)
        @id = params[:id]
        @name = params[:name]
        @email = params[:email]
        @password = params[:password]
        @bio = params[:bio]
    end

    def self.get_all_users
        client = create_db_client
        rawData = client.query("SELECT * FROM users")
        users = Array.new
        rawData.each do |data|
            user = {:id => data["id"], :name => data["name"] ,:email => data["email"], :password => data["password"], :bio => data["bio"]}
            users << user
        end
        response = Response.new('success', 'get all users', users)
        return response.response_api
    end

    def save_user
        client = create_db_client
        client.query("INSERT INTO users(name, email, password, bio) VALUES('#{@name}', '#{@email}', '#{@password}', '#{@bio}')")
        
        id = client.last_id
        rawData = client.query("SELECT * FROM users WHERE id='#{id}'")
        users = Array.new
        rawData.each do |data|
            user = {:id => data["id"], :name => data["name"] ,:email => data["email"], :password => data["password"], :bio => data["bio"]}
            users << user
        end
        response = Response.new('success', 'success input user', users)
        return response.response_api
    end
end