RSpec.configure do |config|
  config.before(:suite) { Faker::UniqueGenerator.clear }
end
