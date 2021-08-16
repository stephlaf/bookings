User.destroy_all

User.create!(email: 'a@a.a', password: '123456')
User.create!(email: 'b@b.b', password: '123456')

count = 1
4.times do
  Item.create(name: "Item #{count}", user: User.first)
  count += 1
end
