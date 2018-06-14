require 'spec_helper'

describe 'Incorrect user details produces valid error' do

  before(:all) do
    @bbc_site = BbcSite.new
    @random = InfoGenerator.new
    @username = @random.generate_username
    @password = @random.generate_password
  end

  context 'it should respond with the correct error when incorrect details are input' do

    it "should produce an error when inputting an incorrect password to a valid account" do

      @bbc_site.homepage.visit_home_page

      # Click sign in link
      @bbc_site.homepage.click_sign_in
      # Fill in username
      @bbc_site.sign_in_page.set_username_value(@username)
      # Fill in password on sing in pages
      @bbc_site.sign_in_page.set_password_value(@password)
      # Click sign in button on sign in page
      @bbc_site.sign_in_page.click_submit_button
      # Assert - error is 'Sorry, we can't find an account with that username. If you\'re over 13, try your email address instead or get help here.'
      expect(@bbc_site.sign_in_page.get_error_message_value).to eq TRUE

    end





  end

end
