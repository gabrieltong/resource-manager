class GbUser < ActiveRecord::Base
  rolify
  attr_accessible :username

  has_and_belongs_to_many :gb_repos
    
  def import_starrings
    require 'json'

    url,options  = 'https://api.github.com/users/gabrieltong/starred',{'User-Agent'=>'gabrieltong'}

    response = HTTParty.get(url,:headers =>options)
    # p response.body
    # p response.code
    # p response.message
    
    # p response.headers.inspect
    p JSON.parse response.body
  end
end
