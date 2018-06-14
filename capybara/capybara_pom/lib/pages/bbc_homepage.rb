require 'capybara/dsl'

class BbcHomepage
  include Capybara::DSL

  # page object
  HOMEPAGE_URL = "http://www.bbc.co.uk"
  SIGN_IN_LINK_ID = "#idcta-link"


  def visit_home_page
    visit(HOMEPAGE_URL)
  end

  def click_sign_in
    find(SIGN_IN_LINK_ID).click
  end


end
