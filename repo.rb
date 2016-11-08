require 'httparty'
require 'pry'

class Repo

  BASE_URI = "https://api.github.com/users/"

  def get(username)
    HTTParty.get("#{BASE_URI}#{username}/repos", :headers => {"Authorization" => "token #{ENV["GITHUB_API_KEY"]}", "User-Agent" => "bmangelsen"})
  end

end
