class GbUser < ActiveRecord::Base
  rolify
  attr_accessible :username

  has_and_belongs_to_many :gb_repos

  def import_starrings(page=1,per_page=100)
    require 'json'

    url,options  = "https://api.github.com/users/gabrieltong/starred?per_page=#{per_page}&page=#{page}",{'User-Agent'=>'gabrieltong'}

    response = HTTParty.get(url,:headers =>options)
    
    items = JSON.parse(response.body)
    items.each do |item|
      repo = GbRepo.find_or_initialize_by_address item['html_url']
      repo.extra = item
      p repo.valid?
      p repo.errors if !repo.valid?
      gb_repos << repo
    end
    import_starrings(page+1) unless items.blank?
  end
end
