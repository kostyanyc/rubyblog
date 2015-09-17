module Api
	module V1
		class BaseController < Api::V1::ApplicationController
		  	protect_from_forgery with: :null_session
		  	before_action :destroy_session
		  	

		  	def destroy_session
		    	request.session_options[:skip] = true
		  	end		  	

		    

		     def authenticate_user!
			    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

			    user_email = options.blank?? nil : options[:email]
			    user = user_email && User.find_by(email: user_email)

			    if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
			      @current_user = user
			    else
			      return unauthenticated!
			    end
			end

			def unauthenticated!
			    response.headers['WWW-Authenticate'] = "Token realm=Application"
			    render json: { error: 'Bad credentials' }, status: 401
			end

		    

		end		
	end
end