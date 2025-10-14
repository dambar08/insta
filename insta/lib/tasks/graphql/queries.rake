namespace :graphql do
  namespace :queries do
    desc 'Validates GraphQL queries against the current schema'
    task validate: [:environment] do
      queries_file = 'spec/fixtures/files/queries.json'
      queries = Oj.load(File.read(queries_file))

      Graphql::Queries::Validate.run_validate(queries, InstaSchema)
    end
  end
end
