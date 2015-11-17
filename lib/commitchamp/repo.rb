

module Commitchamp
  class Repos
  		include HTTParty
  		base_uri "https://api.github.com"

    def initialize
      puts "What is your token?"
      auth_token = gets.chomp
    	@auth = { 
    		"Authorization" => "token #{auth_token}",
    		"User-Agent" => "HTTParty"
    	}
    end

    def get_contributors(owner, repo)
      Repos.get.("/repos/#{owner}/#{repo}/stats/contributors", headers: => @auth)
        
    end

    def get_repos(owner)    
      Repos.get("/orgs/#{owner}/repos", headers: => @auth
                                        body: options.to_json)
    end
  end
end

