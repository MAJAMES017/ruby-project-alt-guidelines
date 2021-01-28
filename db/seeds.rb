Review.delete_all
Customer.delete_all
Barber.delete_all



10.times do
    Customer.create(name:Faker::Games::WarhammerFantasy.hero, location:Faker::Games::Witcher.location)
end

10.times do
    Barber.create(name:Faker::Games::LeagueOfLegends.champion, location:Faker::Games::Witcher.location)
end

10.times do
    Review.create(name:Faker::Marketing.buzzwords, description:Faker::Quote.most_interesting_man_in_the_world,rating:rand(1...10), customer: Customer.all.sample, barber: Barber.all.sample) #do i need the ids genereated here )
end

puts "seeds loaded"



# Faker::TvShows::MichaelScott.quote
# Faker::Games::WarhammerFantasy.hero
# Faker::TvShows::NewGirl.quote
#  Faker::Quote.most_interesting_man_in_the_world     this is a good one for reviews
# Faker::Books::Lovecraft.sentence(word_count: 3)
# Faker::Number.within(range: 1..10)
# Faker::Marketing.buzzwords   this is a good one for the "name/desc"