module Api
	module V1
		class BaseSerializer < ActiveModel::Serializer
		  attributes :id
		end
	end
end