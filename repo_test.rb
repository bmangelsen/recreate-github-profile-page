require 'minitest/autorun'
require 'minitest/pride'
require './repo'

class RepoTest < Minitest::Test

  def test_user_exists
    assert Repo
  end

  def test_can_access_user_repos_api
    repos_tab = Repo.new.get("rposborne")
    assert_equal "ajaxful_rating_jquery", repos_tab[0]['name']
  end

end
