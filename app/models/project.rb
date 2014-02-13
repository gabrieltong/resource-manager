class Project < ActiveRecord::Base
  attr_accessible :address, :extra, :name, :stage
end
