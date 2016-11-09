require "minitest/autorun"
require "minitest/pride"
require "webmock/minitest"
require "./user"

class UserTest < Minitest::Test
  def stub
    stub_request(
      :get,
      "https://api.github.com/users/rposborne?access_token=#{ENV['GITHUB_API_KEY']}"
    ).to_return(
      status: 200,
      body: File.read("query/russell_profile_info.json"),
      headers: { "Content-Type" => "application/json" }
    )
  end

  def test_user_exists
    assert User
  end

  def test_can_access_user_info_api
    stub
    user = User.new.get("rposborne")
    assert_equal "rocketosborne", user["name"]
  end
end
