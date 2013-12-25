class User < ActiveRecord::Base
  include Clearance::User
  # has_many :gb_users_users
end
