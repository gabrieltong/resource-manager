class User < ActiveRecord::Base
  attr_accessible :gb_username
  include Clearance::User
  has_and_belongs_to_many :gb_users,:uniq=>true
  has_many :gb_repos,:through=>:gb_users,:uniq=>true
  has_many :gists,:through=>:gb_users,:uniq=>true
  acts_as_tagger
  letsrate_rater
  before_save :update_gb_users

  def update_gb_users
  	self.gb_users = []
  	self.gb_users << GbUser.find_or_create_by_username(self.gb_username)
  end
end
