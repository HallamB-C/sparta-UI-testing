require 'faker'

class InfoGenerator

  def generate_firstname
    Faker::Name.first_name
  end

  def generate_lastname
    n1 = Faker::Name.last_name
    n2 = Faker::Name.last_name
    n3 = Faker::Name.last_name
    n4 = Faker::Name.last_name
    n5 = Faker::Name.last_name
    "#{n1}#{n2}#{n3}#{n4}#{n5}"
  end

  def generate_username
    number = Random.new.rand(999)+1
    name = Faker::Name.first_name
    "#{name}#{number}"
  end

  #marital status is just a random integer from 0-2s
  def generate_marital_status
    Random.new.rand(2)
  end

  #hobby status is just a random integer from 0-2s
  def generate_hobby_status
    Random.new.rand(2)
  end

  def generate_country
    Faker::Address.country
  end

  #returns a date array of year[0], months[1], day[2]
  def generate_date
    dob = Faker::Date.birthday(4,64).to_s.split('-')
  end

  def generate_phone_number
    # Random.new.rand(2000000000)+79000000000
    Faker::Company.swedish_organisation_number
  end

  def generate_email
    Faker::Internet.safe_email
  end

  def generate_description
    v1 = Faker::Hacker.verb
    a1 = Faker::Hacker.adjective
    n1 = Faker::Hacker.noun
    v2 = Faker::Hacker.ingverb
    a2 = Faker::Hacker.adjective
    n2 = Faker::Hacker.noun
    "I #{v1} #{a1} #{n1}s for work. On weekends I enjoy #{v2} some really #{a2} #{n2}s"
  end

  def generate_password
    # number1 = Random.new.rand(999)+1
    # name = Faker::Name.first_name
    # number2 = Random.new.rand(999)+1
    # "#{number1}#{name}#{number2}"
    Faker::Internet.password(8, 80, true, true)
  end

end
#
ig = InfoGenerator.new
# p ig.generate_firstname
# p ig.generate_lastname
p ig.generate_username
# p ig.generate_marital_status
# p ig.generate_hobby_status
# p ig.generate_country
p dob = ig.generate_date
p dob = ig.generate_date
p dob = ig.generate_date
# p "DOB is #{dob[0]} #{dob[1]} #{dob[2]}"
p ig.generate_phone_number
# p ig.generate_email
# p ig.generate_description
p ig.generate_password
