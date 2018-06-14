require_relative 'services/selenium_demoqa_registration'

class TestingApp

  def demo_qa
    SeleniumDemoReg.new
  end


end
