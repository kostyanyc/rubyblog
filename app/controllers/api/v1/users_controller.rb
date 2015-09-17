class Api::V1::UsersController < ApplicationController
  respond_to :json

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
    respond_with User.find(params[:id])
  end
end