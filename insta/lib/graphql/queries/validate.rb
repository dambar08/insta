module Graphql
  module Queries
    module Validate
      def self.run_validate(queries, schema)
        Rails.logger.debug '⏳  Validating queries...'
        Rails.logger.debug "\n"

        results = queries.map { |query| schema.validate(query) }
        errors = results.flatten

        if errors.empty?
          Rails.logger.debug '✅  All queries are valid'
        else
          print_errors(errors)
        end
      end

      def self.print_errors(errors)
        Rails.logger.debug 'Detected the following errors:'
        Rails.logger.debug "\n"

        errors.each do |error|
          path = error.path.join(', ')
          Rails.logger.debug { "❌  #{path}: #{error.message}" }
        end
      end
    end
  end
end
