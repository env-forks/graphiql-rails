Rails.application.routes.draw do
  mount Graphiql::Rails::Engine, at: "/graphiql", graphql_path: "/my/graphql/endpoint"
end
