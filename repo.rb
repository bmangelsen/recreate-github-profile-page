require 'httparty'
require 'pry'
require 'active_support'
require 'active_support/core_ext'

class Repo

  BASE_URI = "https://api.github.com/users/"

  def get(username)
    HTTParty.get("#{BASE_URI}#{username}/repos", query: {sort: :pushed}, :headers => {"Authorization" => "token #{ENV["GITHUB_API_KEY"]}", "User-Agent" => "bmangelsen"})
  end

end
