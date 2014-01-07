class User < ActiveRecord::Base
  attr_accessible :gb_username
  include Clearance::User
  has_and_belongs_to_many :gb_users
  has_many :gb_repos,:through=>:gb_users
  has_many :gists,:through=>:gb_users
  acts_as_tagger

  after_save :update_gb_users

  def update_gb_users

  end
end
