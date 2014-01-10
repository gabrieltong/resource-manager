class GbRepo < ActiveRecord::Base
  define_statistic :language_count, :count => :all,:filter_on => { :language => 'language = ?'}

  attr_accessible :address,:extra,:language
  serialize :extra
  acts_as_taggable_on :menus
  letsrate_rateable :score

  before_save :set_language

  def set_language
    self.language = self.extra['language']
  end
end
