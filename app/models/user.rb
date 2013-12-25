class User < ActiveRecord::Base
  include Clearance::User
  has_and_belongs_to_many :gb_users
  has_many :gb_repos,:through=>:gb_users
  acts_as_tagger
end
