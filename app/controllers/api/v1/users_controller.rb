module Api
	module V1
		class UsersController < Api::V1::BaseController
		  def index
		    users = User.all

		    render(
		        json: ActiveModel::ArraySerializer.new(
		           users,
		           each_serializer: Api::V1::UserSerializer,
		           root: 'users',
		        )
		    )
		  end

		  def show
		    user = User.find(params[:id])
		    #puts YAML::dump(user)
		    render(
		    	json: Api::V1::UserSerializer.new(
		    		user
		    	)
		    )
		  end
		end
    end
end