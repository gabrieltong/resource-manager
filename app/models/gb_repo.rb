class GbRepo < ActiveRecord::Base
  attr_accessible :address,:extra
  serialize :extra
end
