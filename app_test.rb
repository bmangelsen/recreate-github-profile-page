require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require './app'

class AppTest < Minitest::Test
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  def test_get_page_to_ask_for_username
    get "/"
    assert last_response.ok?
    assert_match(/username/, last_response.body)
  end

  def test_can_lookup_repos_for_user
    post "/repos_tab", {username: "rposborne"}
    assert_equal last_response.status, 200
    assert_match(/ajaxful_rating_jquery/, last_response.body)
  end

end
