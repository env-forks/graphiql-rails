require "test_helper"

puts Graphiql::Rails.constants

module Graphiql
  module Rails
    class EditorsControllerTest < ActionController::TestCase
      setup do
        @routes = Graphiql::Rails::Engine.routes
      end

      teardown do
        Graphiql::Rails.config.query_params = false
        Graphiql::Rails.config.initial_query = Graphiql::Rails::WELCOME_MESSAGE
      end

      test "renders Graphiql" do
        get :show, graphql_path: "/my/endpoint"
        assert_response(:success)
        assert_includes(@response.body, "React.createElement(Graphiql", "it renders Graphiql")
        assert_includes(@response.body, "my/endpoint", "it uses the provided path")
        assert_match(/application-\w+\.js/, @response.body, "it includes assets")
      end

      test "it uses initial_query config" do
        get :show, graphql_path: "/my/endpoint"
        assert_includes(@response.body, "Welcome to Graphiql")

        Graphiql::Rails.config.initial_query = "{ customQuery }"
        get :show, graphql_path: "/my/endpoint"
        refute_includes(@response.body, "Welcome to Graphiql")
        assert_includes(@response.body, "{ customQuery }")
      end

      test "it uses query_params config" do
        get :show, graphql_path: "/my/endpoint"
        refute_includes(@response.body, "onEditQuery")

        Graphiql::Rails.config.query_params = true
        get :show, graphql_path: "/my/endpoint"
        assert_includes(@response.body, "onEditQuery")
      end
    end
  end
end
