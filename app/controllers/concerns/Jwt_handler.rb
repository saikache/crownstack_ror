module JwtHandler

  def encode_token(payload)
    JWT.encode(payload.merge(expires_at: (Time.current + 42.hour).to_i), ENV['SECRET'])
  end

  def decoded_token
    token = request.headers['Authorization']
    if token
      begin
        JWT.decode(token, ENV['SECRET'])
      rescue JWT::DecodeError
        nil
      end
    else
      nil
    end
  end

  private

  def validate_token_time(time)
    Time.current < Time.at(time)
  end
end
