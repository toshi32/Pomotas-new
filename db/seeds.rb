# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Label.create!(
  [
    {name: '学習'},
    {name: '仕事'},
    {name: '会議'},
    {name: '約束'},
    {name: '家事'},
    {name: 'デート'},
    {name: '食事'},
    {name: '運動'},
    {name: '午前'},
    {name: '午後'}
  ]
)