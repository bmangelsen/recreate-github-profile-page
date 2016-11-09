require "httparty"
require "pry"

class Repo
  BASE_URI = "https://api.github.com/users/".freeze

  def get(username)
    HTTParty.get("#{BASE_URI}#{username}/repos?access_token=#{ENV['GITHUB_API_KEY']}")
  end
end
