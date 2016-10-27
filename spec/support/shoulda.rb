require 'shoulda/matchers'

RSpec.configure do |config|
  Shoulda::Matchers.configure do |shoulda_config|
    shoulda_config.integrate do |with|
      with.test_framework :rspec

      with.library :active_model
    end
  end
end
