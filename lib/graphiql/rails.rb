require "rails"

if ActiveSupport::Inflector.method(:inflections).arity == 0
  # Rails 3 does not take a language in inflections.
  ActiveSupport::Inflector.inflections do |inflect|
    inflect.acronym("Graphiql")
  end
else
  ActiveSupport::Inflector.inflections(:en) do |inflect|
    inflect.acronym("Graphiql")
  end
end

require "graphiql/rails/engine"
require "graphiql/rails/version"
require "graphiql/rails/welcome_message"


module Graphiql
  module Rails
    class << self
      attr_accessor :config
    end

    self.config = OpenStruct.new({
      query_params: false,
      initial_query: Graphiql::Rails::WELCOME_MESSAGE,
      csrf: false
    })
  end
end
