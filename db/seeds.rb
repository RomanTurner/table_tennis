100.times do 
    Lead.create!( name: Faker::FunnyName.two_word_name, hobby: Faker::Hobby.activity, gender: Faker::Gender.type, email: Faker::Internet.email)
end

20.times do
    List.create!(title: Faker::Hipster.word)
end