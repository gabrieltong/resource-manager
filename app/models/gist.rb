class Gist < ActiveRecord::Base
  attr_accessible :address,:extra
  serialize :extra
  acts_as_taggable_on :menus
end
