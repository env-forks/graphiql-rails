module Graphiql
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Graphiql::Rails
    end
  end
end
