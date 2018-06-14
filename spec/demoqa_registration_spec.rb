require 'spec_helper'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = TestingApp.new.demo_qa
    @driver.access_registration_form
    @generator = InfoGenerator.new

    @firstname = @generator.generate_firstname
    @lastname = @generator.generate_lastname

    @country = @generator.generate_country

    @dob_year = @generator.generate_date[0].to_i
    @dob_month = @generator.generate_date[1].to_i
    @dob_day = @generator.generate_date[2].to_i

    @phonenumber = @generator.generate_phone_number

    @username = @generator.generate_username
    @email = @generator.generate_email
    @description = @generator.generate_description
    @password = @generator.generate_password

  end

  context 'making sure generator is working properly' do

    it "make sure firstname generator is returning a string" do
      expect(@firstname).to be_kind_of String
    end

    it "make sure lastname generator is returning a (long) string" do
      expect(@lastname).to be_kind_of String
    end

    it "make sure country generator is returning a string" do
      expect(@country).to be_kind_of String
    end

    it "make sure DOB is returning a year, month and day" do
      expect(@dob_month.to_i).to be_between(1,12).inclusive
      expect(@dob_day.to_i).to be_between(1,31).inclusive
      expect(@dob_year.to_i).to be_between(1950,2014).inclusive
    end

    it "make sure phonenumber is returning a string" do
      expect(@phonenumber).to be_kind_of String
    end

    it "make sure username is returning a string" do
      expect(@username).to be_kind_of String
    end

    it "make sure username is returning a string" do
      expect(@email).to be_kind_of String
    end

    it "make sure username is returning a string" do
      expect(@description).to be_kind_of String
    end

    it "make sure username is returning a string" do
      expect(@password).to be_kind_of String
    end

  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
      expect(@driver.current_url).to eq 'http://demoqa.com/registration/'
    end

    it 'should accept a first name' do
      expect(@driver.set_first_name_field(@firstname))
    end

    it 'should accept a last name' do
      expect(@driver.set_last_name_field(@lastname))
    end

    it 'should accept a marital status selection of Single(0), Married(1), or Divorced(2)' do
      @driver.select_marital_option(0)
      @driver.select_marital_option(1)
      @driver.select_marital_option(2)
    end

    it 'should accept a hobby status selection of Dance(0), Reading(1), or Cricket(2)' do
      @driver.select_hobby_option(0)
      @driver.select_hobby_option(1)
      @driver.select_hobby_option(2)
    end

    it 'should have a country default of Afhghanistan' do
      expect(@driver.get_selected_country).to eq 'Afghanistan'
    end

    it 'should accept a new country value' do
      @driver.set_country(@country)
    end

    it 'accept a new DOB' do
      @driver.dob_month_list_select(@dob_month)
      @driver.dob_day_list_select(@dob_day)
      @driver.dob_year_list_select(@dob_year)
    end

    it 'should accept a valid phone number' do
      @driver.set_phone_number_field(@phonenumber)
    end

    it 'should accept a username' do
      @driver.set_user_name_field(@username)
    end

    it "should accept an email" do
      @driver.set_email_field(@email)
    end

    it 'should accept an about yourself text' do
      @driver.set_about_yourself_field(@description)
    end

    it 'should accept a password' do
      @driver.set_password_field(@password)
    end

    it 'should accept a password confirmation' do
      @driver.set_confirmation_password_field(@password)
    end

  end

  context 'make sure values have been entered correctly after ' do

    it "firstname entered to form should match the firstname generated" do
      expect(@driver.get_first_name_field_value).to eq @firstname
    end

    it "lastname entered to form should match the lastname generated" do
      expect(@driver.get_last_name_field_value).to eq @lastname
    end

    it "country entered to form should match the country generated" do
      expect(@driver.get_selected_country).to eq @country
    end

    it "dob year entered to form should match the year generated" do
      expect(@driver.dob_year_list_get_value.to_i).to eq @dob_year
    end

    it "dob month entered to form should match the month generated" do
      expect(@driver.dob_month_list_get_value.to_i).to eq @dob_month
    end

    it "dob day entered to form should match the day generated" do
      expect(@driver.dob_day_list_get_value.to_i).to eq @dob_day
    end

    it "phone number entered should match the phone number generated" do
      expect(@driver.get_phone_number_field_value).to eq @phonenumber
    end

    it "username entered should match username generated" do
      expect(@driver.get_user_name_field_value).to eq @username
    end

    it "email entered should match email generated" do
      expect(@driver.get_email_field_value).to eq @email
    end

    it "email entered should match email generated" do
      expect(@driver.get_about_yourself_value).to eq @description
    end

  end

  context 'make sure all info can be submitted and has been submitted' do

    it "should submit info when submit is clicked" do
      @driver.click_submit
    end

    it "should check everything has been submitted successfully" do
      @driver.check_registration_successful

    end

  end

end
