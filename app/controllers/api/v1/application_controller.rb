module Api
	module V1
		class ApplicationController < ActionController::API
			include ActionController::Serialization
			include ActionController::RequestForgeryProtection
		end
	end
end