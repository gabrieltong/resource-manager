class GbUser < ActiveRecord::Base
  rolify
  attr_accessible :username

  has_and_belongs_to_many :gb_repos

  has_and_belongs_to_many :gists  

  # validate :validate_github_username

  def validate_github_username
    errors.add(:username,'wrong_username')
  end

  def import_newest_stared_gb_repos
    import_stared_gb_repos :all=>false
  end

  def import_stared_gb_repos(options={})
    require 'json'

    defaults = {:page=>1,:per_page=>100,:all=>true}
    options = defaults.merge options

    url,headers  = "https://api.github.com/users/#{username}/starred?per_page=#{options[:per_page]}&page=#{options[:page]}",{'User-Agent'=>"#{username}"}

    response = HTTParty.get(url,:headers =>headers)
    
    items = JSON.parse(response.body)
    items.each do |item|
      repo = GbRepo.find_or_initialize_by_address item['html_url']
      repo.extra = item
      gb_repos << repo
    end

    if (options[:all] and !items.blank?)
      import_stared_gb_repos(:page=>options[:page]+1) 
    end
  end

  def import_gists(page=1,per_page=100)
    require 'json'

    url,options  = "https://api.github.com/users/#{username}/gists?per_page=#{per_page}&page=#{page}",{'User-Agent'=>"#{username}"}

    response = HTTParty.get(url,:headers =>options)
    
    items = JSON.parse(response.body)
    items.each do |item|
      gist = Gist.find_or_initialize_by_address item['url']
      gist.extra = item
      gists << gist
    end
    import_gists(page+1) unless items.blank?
  end

  # def http_response(url,options)
  #   response = HTTParty.get(url,:headers =>options)
  # end
end
