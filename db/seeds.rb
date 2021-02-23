# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(name: 'Vova', surname: 'Ruby', dob: '19841023', role: 'user')
user_2 = User.create(name: 'Misha', surname: 'Rails', dob: '19860714', role: 'user')

categories_params = [{ title: 'Programming' }, { title: 'Mathematics' }, { title: 'Art' }]

categories = Category.create(categories_params)

test_1 = Test.create(title: 'Ruby Language', category_id: categories[0].id, level: 2)
test_2 = Test.create(title: 'JavaScript', category_id: categories[0].id, level: 1)
test_3 = Test.create(title: 'HTML/CSS', category_id: categories[0].id)
test_4 = Test.create(title: 'Elementary', category_id: categories[1].id)
test_5 = Test.create(title: 'Artists', category_id: categories[2].id)

question_1 = Question.create(body: '2 + 2 = ?',  test_id: test_4.id)
question_2 = Question.create(body: '4 - 5  = ?', test_id: test_4.id)
question_3 = Question.create(body: '4 + 5  = ?', test_id: test_4.id)
question_4 = Question.create(body: '20 / 5  = ?', test_id: test_4.id)
question_5 = Question.create(body: '7 * 3  = ?', test_id: test_4.id)

answers_params = [
  { body: '5', question_id: question_1.id },
  { body: '4', question_id: question_1.id, correct: true },
  { body: '55', question_id: question_1.id },
  { body: '10', question_id: question_1.id },
  { body: '12', question_id: question_2.id },
  { body: '1', question_id: question_2.id },
  { body: '3', question_id: question_2.id },
  { body: '-1', question_id: question_2.id, correct: true },
  { body: '0', question_id: question_3.id },
  { body: '9', question_id: question_3.id, correct: true },
  { body: '15', question_id: question_3.id },
  { body: '100', question_id: question_3.id },
  { body: '3', question_id: question_4.id },
  { body: '15', question_id: question_4.id },
  { body: '7', question_id: question_4.id },
  { body: '4', question_id: question_4.id, correct: true },
  { body: '24', question_id: question_5.id },
  { body: '20', question_id: question_5.id },
  { body: '21', question_id: question_5.id, correct: true },
  { body: '22', question_id: question_5.id }
]

Answer.create(answers_params)

result_params = [
  { user_id: user_1.id, test_id: test_1.id, completed: true },
  { user_id: user_2.id, test_id: test_2.id }
]

Result.create(result_params)
