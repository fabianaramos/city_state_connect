module Error
  class CustomError < StandardError
    attr_reader :status, :error, :message

    def initialize(_error=nil, _status=nil, _message=nil)
      @error = _error || :unprocessable_entity
      @status = _status || 422
      @message = _message || 'Um erro inesperado ocorreu'
    end

    def fetch_json
      Helpers::Render.json(error, message, status)
    end
  end
end
