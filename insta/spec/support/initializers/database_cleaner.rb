RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before do
    DatabaseCleaner[:active_record].strategy = :transaction
  end

  config.before(:each, :js) do
    DatabaseCleaner.strategy = :truncation, { except: ['options', 'option_translations'] }
  end

  config.before do |_example|
    DatabaseCleaner.start
  end

  config.after do |_example|
    DatabaseCleaner.clean
  end
end
