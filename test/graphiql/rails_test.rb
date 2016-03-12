require "test_helper"

module Graphiql
  class RailsTest < ActiveSupport::TestCase
    test "configs can be set" do
      refute Graphiql::Rails.config.query_params
      Graphiql::Rails.config.query_params = true
      assert Graphiql::Rails.config.query_params
      Graphiql::Rails.config.query_params = false
    end
  end
end
