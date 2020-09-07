module UserAuthHandler
  extend ActiveSupport::Concern
  include JwtHandler

  def current_user
    token = decoded_token
    user_id = token[0]['user_id'] if token
    @user ||= User.find_by(id: user_id)
  end
 
  def authenticate_user
    decoded_value = decoded_token
    time_in_sec = decoded_value[0]['expires_at'] if decoded_value && decoded_value.is_a?(Array)
    if time_in_sec
      if validate_token_time(time_in_sec)
        unless (current_user.is_a? User)
          render json: { message: 'Login Required' }, status: :unauthorized
        end
      else
        error_response('Session expired. Please login again')
      end
    else
      error_response('Auth Token Required', 401)
    end
  end

end
