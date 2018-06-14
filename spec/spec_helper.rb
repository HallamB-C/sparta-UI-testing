require 'selenium-webdriver'
require_relative '../lib/testingapp'
require_relative '../lib/services/generators/infogenerator'

RSpec.configure do |config|
  config.formatter = :documentation
end
