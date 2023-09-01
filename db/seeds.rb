# frozen_string_literal: true

require 'ffaker'

# frozen_string_literal: true
# User creation
5.times do
  user = User.new(
    email: FFaker::Internet.email,
    name: FFaker::Name.unique.name,
    username: FFaker::Internet.user_name,
    age: rand(18..80),
    gender: FFaker::Gender.binary
  )
  user.password = '123456'
  user.image.attach(
    io: File.open(Rails.root.join('app/assets/images/photo.jpg').to_s),
    filename: 'photo.jpg'
  )
  user.save!
end
# Topic creation
5.times do
  topic = Topic.new(
    title: FFaker::Lorem.word,
    description: FFaker::Lorem.sentence,
    user_id: User.pluck(:id).sample
  )
  topic.image.attach(
    io: File.open(Rails.root.join('app/assets/images/photo.jpg').to_s),
    filename: 'photo.jpg'
  )
  topic.save!
end
# Question creation with categorization
5.times do
  question = Question.create!(
    title: FFaker::Lorem.sentence,
    body: FFaker::Lorem.paragraph,
    user_id: User.pluck(:id).sample
  )
  Categorization.create!(
    question_id: question.id,
    topic_id: Topic.pluck(:id).sample
  )
end
# Answers creation
5.times do
  Answer.create!(
    body: FFaker::Lorem.paragraph,
    question_id: Question.pluck(:id).sample,
    user_id: User.pluck(:id).sample
  )
end
