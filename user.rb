require "httparty"
require "pry"

class User
  BASE_URI = "https://api.github.com/users/".freeze

  def get(username)
    HTTParty.get("#{BASE_URI}#{username}?access_token=#{ENV['GITHUB_API_KEY']}")
  end
end
