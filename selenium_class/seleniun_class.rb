require 'selenium-webdriver'

class SeleniumQaToolsForm

  @practice_form_url = "http://toolsqa.com/automation-practice-form"
  @firstname_field = "firstname"
  @lastname_field = "lastname"
  @sex_button_male = "sex-0"
  @sex_button_female = "sex-1"
  @exp_buttom_1 = "exp-0"
  @date_field = "datepicker"
  @profession_button = "profession-1"

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new(args: ['user-data-dir=/Users/tech-a42/Library/Application Support/Google/Chrome/Default'])
    # profile.add_extension(File.dirname(__FILE__) +"../extensions/uBlock-Origin_v1.16.10.crx")
    dir = '/Users/tech-a42/Library/Application Support/Google/Chrome/'
    @chrome_driver = Selenium::WebDriver.for(:chrome, :switches => %w[--user-data-dir=#{dir}])
  end

  def visit_practice_form
    @chrome_driver.get(@practice_form_url)
  end

  def input_firstname_field(text)
    @chrome_driver.find_element(:name, @firstname_field).send_keys(text)
  end
  def get_firstname_value(text)
    p @chrome_driver.find_element(:name, @firstname_field)['value']
  end

  def input_lastname_field text
    @chrome_driver.find_element(:name, @lastname_field).send_keys(text)
  end
  def input_lastname_value(text)
    p @chrome_driver.find_element(:name, @lastname_field)['value']
  end

  def tick_sex_box
    @chrome_driver.find_element(:name, @sex_button_male).click
  end

  def tick_exp_box
    @chrome_driver.find_element(:name, @exp_buttom_1).click
  end

  def input_date text
    @chrome_driver.find_element(:name, @date_field).send_keys(text)
  end

  def input_profession text
    @chrome_driver.find_element(:name, @profession_button).click
  end


  sleep 5

end

testing = SeleniumQaToolsForm.new
testing.visit_practice_form
testing.input_firstname_field("Hakim")
testing.input_lastname_field("Raruariruwariaruwarimehimabdulam")
testing.input_lastname_field(10101)
