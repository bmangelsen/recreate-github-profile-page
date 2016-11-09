require "minitest/autorun"
require "minitest/pride"
require "webmock/minitest"
require "./repo"

class RepoTest < Minitest::Test
  def stub
    stub_request(
      :get,
      "https://api.github.com/users/rposborne/repos?access_token=#{ENV['GITHUB_API_KEY']}"
    ).to_return(
      status: 200,
      body: File.read("query/russell_repo_info.json"),
      headers: { "Content-Type" => "application/json" }
    )
  end

  def test_repo_exists
    assert Repo
  end

  def test_can_access_user_repos_api
    stub
    repos_tab = Repo.new.get("rposborne")
    assert_equal "ajaxful_rating_jquery", repos_tab[0]["name"]
  end
end
