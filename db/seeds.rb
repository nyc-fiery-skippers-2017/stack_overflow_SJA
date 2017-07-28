require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Vote.delete_all
Comment.delete_all

boo = [true, false]

users = []
50.times do
  users << User.create(username: Faker::GameOfThrones.character, email: Faker::Internet.email, password: "password")
end

questions = []
answers = []

6.times do
  question = Question.create(title: Faker::Hipster.words, body: Faker::Hipster.paragraph, user: users.sample)
  4.times do
    question.votes.create(voter: users.sample, vote_choice: boo.sample)
    4.times do
      question.comments.create(comment_string: Faker::Hipster.sentence, commenter: users.sample )
      questions << question
    end
  end
end



6.times do
  answer = Answer.create(answer_string: Faker::Hipster.words, user: users.sample, question: questions.sample)
  4.times do
    answer.votes.create(voter: users.sample, vote_choice: boo.sample)
    (4).times do
      answer.comments.create(comment_string: Faker::Hipster.sentence, commenter: users.sample)
      answers << answer
    end
  end
end

# 50.times do
#   comments << Comment.create(comment_string: Faker::Hipster.sentence(4), commentable: posts.sample, commenter: users.sample )
# end
