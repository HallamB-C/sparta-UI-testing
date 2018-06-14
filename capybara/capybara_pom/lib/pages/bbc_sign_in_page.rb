require 'capybara/dsl'

class BbcSignInPage
  include Capybara::DSL

  USERNAME_FIELD = "user-identifier-input"
  PASSWORD_FIELD = "password-input"
  SUBMIT_BUTTON = "submit-button"
  SIGN_IN_ERROR_MESSAGE = "form-message-username"

  def get_username_field
    find(USERNAME_FIELD)
  end
  def get_username_value
    find(USERNAME_FIELD).value
  end
  def set_username_value text
    fill_in(USERNAME_FIELD, with: text)
  end

  def get_password_field
    find(PASSWORD_FIELD)
  end
  def get_password_value
    find(PASSWORD_FIELD).value
  end
  def set_password_value text
    fill_in(PASSWORD_FIELD, with: text)
  end

  def get_submit_button
    find(SUBMIT_BUTTON)
  end
  def click_submit_button
    click_button(SUBMIT_BUTTON)
  end

  def get_error_message_field
    find_by_id(PASSWORD_FIELD)
  end
  def get_error_message_value
    page.has_content? 'Sorry, we can’t find an account with that username. If you\'re over 13, try your email address instead or get help here.'
  end


end
