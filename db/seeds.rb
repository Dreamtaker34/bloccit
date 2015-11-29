include RandomData

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

25.times do
  Advertisement.create!(
    title: "GET RiCH qUiCK!!!!",
    copy: "I maKE 10,000 $$$ a DAy at HOME!!! Its oS eAsY! iN thE tIMe It took to read tHIS i boUgHt a NEw CAR AnD SHOES!!1!",
    price: 49
  )
end

  puts "Seed finished"
  puts "#{Post.count} posts created"
  puts "#{Comment.count} comments created"
  puts "#{Advertisement.count} comments created"
