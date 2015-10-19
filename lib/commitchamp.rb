require "httparty"
require "pry"

require "commitchamp/repo"
require "commitchamp/version"

# Probably you also want to add a class for talking to github.

module Commitchamp
  class App
  	def initialize
  		@repos = Repos.new
  		@data = []
  	end

    def run
    	@repos.repo
    	contributors = @repo.contributors(owner, repo)
    	table(contributors)
      # Your code goes here...
    end
  
  def table (contributors)
  	contributors.map do |c|
  		author = c["author"]
  		weeks = c["weeks"]
  		a = 0
  		d = 0
  		c = 0
  		end
  		weeks.map do |w|
  			a += w["a"]
  			d += w["d"]
  			c += w["c"]
  		end
  	end
  		@data.push({:l => author, :a => a, :d => d, :c => c })
  end
  @data
end

app = Commitchamp::App.new
app.run
