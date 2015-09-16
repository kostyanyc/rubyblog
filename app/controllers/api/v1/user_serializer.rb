module Api
  module V1
    class UserSerializer < Api::V1::BaseSerializer
      attributes :id, :email, :profile_name, :created_at, :updated_at

      has_many :statuses

      def created_at
        object.created_at.in_time_zone.iso8601 if object.created_at
      end

      def updated_at
        object.updated_at.in_time_zone.iso8601 if object.created_at
      end
    end
  end
end