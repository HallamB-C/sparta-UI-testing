require 'spec_helper'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
      expect(@driver.current_url).to eq 'http://demoqa.com/registration/'
    end

    it 'should accept a first name' do
      expect(@driver.set_first_name_field("Hakim Abdul Jafari"))
    end

    it 'should accept a last name' do
      expect(@driver.set_last_name_field("Raruariruwariaruwarimehimabdulam"))
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
      @driver.set_country("Uganda")
    end

    it 'accept a new DOB' do
      @driver.dob_month_list_select((Random.new.rand(11)+1))
      @driver.dob_day_list_select((Random.new.rand(27)+1))
      @driver.dob_year_list_select(2014)
    end

    it 'should accept a valid phone number' do
      @driver.set_phone_number_field("02012345678")
    end

    it 'should accept a username' do
      @driver.set_user_name_field("FridayBikesh")
    end

    it "should accept an email" do
      @driver.set_email_field("Bikesh@rana.com")
    end

    it 'should accept an about yourself text' do
      @driver.set_about_yourself_field("Ladies first, partner?’ Edward asked. I looked up to see him smiling a crooked smile so beautiful that I could only stare at him like an idiot. ‘Or I could start, if you wish.’,’ I said, flushing. ‘I’ll go ahead.’ assessment was confident. ‘Prophase.’ you mind if I look?’ He asked as I began to remove the slide. His hand caught mine, to stop me, as he asked. His fingers were ice-cold, like he’d been holding them in a snowdrift before class. But that why I so quickly. When he touched me, it stung my hand as if an electric current had passed through us.’ he agreed. He switched out the first slide for the second, and then glanced at it cursorily. ’ he murmured, writing it down as he spoke. kept my voice indifferent. ‘May I?’ smirked and pushed the microscope to me. We were finished before anyone else was even close.”")
    end

    it 'should accept a password' do
      @driver.set_password_field("123456789")
    end

    it 'should accept a password confirmation' do
      @driver.set_confirmation_password_field("123456789")
    end

    it "should submit info when submit is clicked" do
      @driver.click_submit
      sleep 10
    end
    
    it "should check everything has been submitted successfully" do
      @driver.check_registration_successful
    end


  end

end
