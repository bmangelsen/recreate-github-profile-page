require "sinatra"
require "erb"
require "pry"
require "./repo"
require "active_support"
require "active_support/core_ext"

helpers do
  def render_template(filename)
    template = File.read(filename)
    ERB.new(template).result(binding)
  end
end

get "/" do
  render_template("root.html.erb")
end

post "/repos_tab" do
  @repos = Repo.new.get(params["username"])
  render_template("repos_tab.html.erb")
end
