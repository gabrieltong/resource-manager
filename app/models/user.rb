class User < ActiveRecord::Base
  attr_accessible :gb_username
  include Clearance::User
  has_and_belongs_to_many :gb_users
  has_many :gb_repos,:through=>:gb_users
  has_many :gists,:through=>:gb_users
  acts_as_tagger

  before_save :update_gb_users

  def update_gb_users
  	self.gb_users = []
  	self.gb_users << GbUser.find_or_create_by_username(self.gb_username)
  end
end
