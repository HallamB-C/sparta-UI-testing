require_relative 'pages/bbc_homepage'
require_relative 'pages/bbc_sign_in_page'



class BbcSite

  def homepage
    BbcHomepage.new
  end

  def sign_in_page
    BbcSignInPage.new
  end

end
