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

Post.find_or_create_by(title: "Sponser Message", body: "This is a message from our sponsers")

Comment.find_or_create_by(body: "Buy our stuff!!1!")

  puts "Seed finished"
  puts "#{Post.count} posts created"
  puts "#{Comment.count} comments created"
