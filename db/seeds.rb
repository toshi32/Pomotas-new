# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Label.create!(
  [
    {name: '午前'},
    {name: '午後'},
    {name: '勉強'},
    {name: '仕事'},
    {name: '会議'},
    {name: '約束'},
    {name: '家事'},
    {name: 'デート'},
    {name: '食事'},
    {name: '運動'},
  ]
)

#User

user1 = User.create!(
  name: "toshi",
  email: "test1@example.com",
  password: "password1",
  password_confirmation: "password1",
  admin: true
)
user2 = User.create!(
  name: "miki",
  email: "test2@example.com",
  password: "password2",
  password_confirmation: "password2"
)
user3 = User.create!(
  name: "miku",
  email: "test3@example.com",
  password: "password3",
  password_confirmation: "password3"
)
user4 = User.create!(
  name: "tamaki",
  email: "test4@example.com",
  password: "password4",
  password_confirmation: "password4"
)
user5 = User.create!(
  name: "masa",
  email: "test5@example.com",
  password: "password5",
  password_confirmation: "password5"
)

# Task

task1 = Task.create!(
  title: "中国語",
  content: 'テキスト P10～15',
  time_limit: '2021/07/15',
  user_id: user1.id
)
task2 = Task.create!(
  title: "新宿伊勢丹に買い物",
  content: 'パパにプレゼント買ってもらう',
  time_limit: '2021/07/20',
  user_id: user2.id
)
task3 = Task.create!(
  title: "保育園の夕涼み会",
  content: '●●君とフォークダンス踊る！！',
  time_limit: '2021/07/25',
  user_id: user3.id
)
task4 = Task.create!(
  title: "ストライダーの練習",
  content: '坂道からノンストップで滑走できるようにする',
  time_limit: '2021/07/30',
  user_id: user4.id
)
task5 = Task.create!(
  title: "読書",
  content: '論語 P100～130',
  time_limit: '2021/08/05',
  user_id: user5.id
)

#coment

comment1 = Comment.create!(
  content: '四声むずい。。',
  task_id: task1.id
)
comment2 = Comment.create!(
  content: 'コーチもしくはプラダの財布が目標',
  task_id: task2.id
)
comment3 = Comment.create!(
  content: 'パパに見つからないようする',
  task_id: task3.id
)
comment4 = Comment.create!(
  content: '四声むずい。。',
  task_id: task4.id
)
comment5 = Comment.create!(
  content: '孔子になりきる！！！',
  task_id: task5.id
)