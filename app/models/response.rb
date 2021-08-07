class Response
    attr_reader :status, :message, :data

    def initialize(status, message, data=nil)
        @status = status
        @message = message
        @data = data
    end

    def response_api
        return {"status" => @status, "message" => @message, "data" => @data}
    end
end