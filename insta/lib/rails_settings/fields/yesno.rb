module RailsSettings
  module Fields
    class YesNo < ::RailsSettings::Fields::Base
      def serialize(value)
        case value
        when true then "YES"
        when false then "NO"
        else raise StandardError, 'invalid value'
        end
      end

      def deserialize(value)
        case value
        when "YES" then true
        when "NO" then false
        end
      end
    end
  end
end
