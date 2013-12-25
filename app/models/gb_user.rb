class GbUser < ActiveRecord::Base
  rolify
  attr_accessible :username

  has_and_belongs_to_many :gb_repos

  has_and_belongs_to_many :gists  

  def import_stared_gb_repos(page=1,per_page=100)
    require 'json'

    url,options  = "https://api.github.com/users/gabrieltong/starred?per_page=#{per_page}&page=#{page}",{'User-Agent'=>'gabrieltong'}

    response = HTTParty.get(url,:headers =>options)
    
    items = JSON.parse(response.body)
    items.each do |item|
      repo = GbRepo.find_or_initialize_by_address item['html_url']
      repo.extra = item
      gb_repos << repo
    end
    import_stared_gb_repos(page+1) unless items.blank?
  end

  def import_gists(page=1,per_page=100)
    require 'json'

    url,options  = "https://api.github.com/users/gabrieltong/gists?per_page=#{per_page}&page=#{page}",{'User-Agent'=>'gabrieltong'}

    response = HTTParty.get(url,:headers =>options)
    
    items = JSON.parse(response.body)
    items.each do |item|
      p item
      gist = Gist.find_or_initialize_by_address item['url']
      gist.extra = item
      gists << gist
    end
    import_gists(page+1) unless items.blank?
  end
end
