# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email:"m@m.com",password: "password", password_confirmation: "password", admin: true)

10.times do |i|
  User.create!(email:Faker::Internet.unique.email, password:"pass123", password_confirmation:"pass123",admin:false)
end

prng = Random.new

#Country.create!([{name:"Serbia"},{name:"Croatia"},{name:"Montenegro"},{name:"Italy"},{name:"Hungary"}])

5.times do |c|
  #Country.create!(name: Faker::Address.country)
  country = Country.new
  country.name = Faker::Address.country
  country.save


  5.times do |l|
  #  Location.create!(name: Faker::Address.city, province: Faker::Address.state, )
    location = country.locations.build(name: Faker::Address.city, province: Faker::Address.state)
    location.save
  end

  3.times do |li_i|
    li = LicenceIssuer.new
    li.name = Faker::Company.name

    li.save

    prng.rand(1..3).times do |i|
      fishery = Fishery.new
      fishery.name = "Fishery of #{Faker::Address.community}"
      fishery.description = Faker::Lorem.paragraph_by_chars(number: 150)
      fishery.country_id = country.id
      fishery.licence_issuer_id = li.id

      fishery.save
    end#fishery

    5.times do |w|
      fw = FishWarden.new
      fw.name = Faker::Name.name
      fw.phone = Faker::PhoneNumber.cell_phone_in_e164
      fw.licence_issuer_id = li.save

      fw.save
    end
  end #licecneissuer
end #country

BodyOfWater.create!([
  {name: "Long", water_type: :river, description:  Faker::Lorem.paragraph_by_chars(number: 150)},
  {name: "Green", water_type: :river, description:  Faker::Lorem.paragraph_by_chars(number: 150)},
  {name: "Fast", water_type: :river, description:  Faker::Lorem.paragraph_by_chars(number: 150)},
  {name: "Deep", water_type: :lake, description:  Faker::Lorem.paragraph_by_chars(number: 150)},
  {name: "Crystal", water_type: :lake, description:  Faker::Lorem.paragraph_by_chars(number: 150)}
])

Fish.create([
    {name: "Common carp", latin_name: "Cyprinus Carpio", description: Faker::Lorem.paragraph_by_chars(number: 150)},
    {name: "Chub", latin_name: "Leuscius cephalus", description: Faker::Lorem.paragraph_by_chars(number: 150)},
    {name: "Zander", latin_name: "Stizostedion lucioperca", description: Faker::Lorem.paragraph_by_chars(number: 150)},
    {name: "Northern pike", latin_name: "Esox lucius", description: Faker::Lorem.paragraph_by_chars(number: 150)},
    {name: "Perch", latin_name: "Perca fluviatilis", description: Faker::Lorem.paragraph_by_chars(number: 150)},
])


15.times do |i|
  fa = FishingArea.new
  fa.name = Faker::Lorem.sentence(word_count: 3, random_words_to_add: 3)
  fa.description = Faker::Lorem.paragraph_by_chars(number: 200)
  fa.views = Faker::Number.between(from: 1, to: 1000)
  fa.user_id = prng.rand(1..10)
  fa.body_of_water_id = prng.rand(1..5)
  fa.country_id = prng.rand(1..5)
  fa.location_id = Location.where(country_id: fa.country.id)[prng.rand(0..1)].id
  fa.fishery_id  = Fishery.where(country_id: fa.country.id)[prng.rand(0..2)].id

  3.times do |f|
    fa.fish << Fish.find(prng.rand(1..5))
  end

  #fa.attach(io: open('https://picsum.photos/1920/1080'), filename: "#{i}_banner.jpg")

  fa.save

  (2 + prng.rand(10)).times do |j|
    #this is how I should\ve done nested moels
    comment = fa.comments.build(body: Faker::Lorem.sentences(number: 1), user: User.find(1 + prng.rand(3)))
    comment.save
  end

end
