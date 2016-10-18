defmodule PhoenixBoilerplate.PageControllerTest do
  use PhoenixBoilerplate.ConnCase
  use Hound.Helpers

  hound_session

  # Hostname for hound session. 
  # Setting at phantomjs container in docker-compose.yml
  @app_host "http://example.com"
  @app_port 4001

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"

  end

  test "GET / by using hound" do
    navigate_to("#{@app_host}:#{@app_port}/")

    assert page_source =~ "Welcome to Phoenix!"

    find_element(:link_text, "Guides")
    |> click

    assert current_url == "http://www.phoenixframework.org/docs/overview"
  end

  test "Get docs about tasks" do
    navigate_to("#{@app_host}:#{@app_port}/")

    assert page_source =~ "Welcome to Phoenix!"

    find_element(:link_text, "Docs")
    |> click

    assert current_url == "https://hexdocs.pm/phoenix/Phoenix.html"

    assert page_source =~ "This is documentation for the Phoenix project"
  end

  test "Google phoenix" do
    navigate_to("https://www.google.com/")

    find_element(:name, "q")
    |> fill_field("phoenix framework")
    
    find_element(:name, "q")
    |> submit_element

    assert page_source =~ "phoenixframework"
  end
end
