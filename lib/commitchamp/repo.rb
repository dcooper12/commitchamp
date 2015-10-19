

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

    def contributors(owner, repo)
      self.class.get.("/repos/#{owner}/#{repo}/stats/contributors", :headers => @auth)
        
    end

    def repo
      #prompt and return repo name
      puts "Which repository would you like to access?"
      @name = gets.chomp
      puts "What is the owner's name?"
      @owner = gets.chomp
      # self.class.get("/orgs/#{owner}/repos", :headers => @auth)
    binding.pry
    end
  end
end

