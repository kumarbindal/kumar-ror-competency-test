Role.delete_all
p "Creating Role in database"
r1 = Role.create({ name: 'User', description: 'Can read and show article' })
r2 = Role.create({ name: 'Editor', description: 'Can perform CRUD operation only on his/her article' })
r3 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })

User.delete_all
p "Creating User in database"
u1 = User.create!({ name: 'User', email: 'user@example.com', password: 'password', password_confirmation: 'password', role_id: r1.id })
u2 = User.create!({ name: 'Editor User 1', email: 'editoruser1@example.com', password: 'password', password_confirmation: 'password', role_id: r2.id })
u3 = User.create!({ name: 'Editor User 2', email: 'editoruser2@example.com', password: 'password', password_confirmation: 'password', role_id: r2.id })
u4 = User.create!({ name: 'Admin User', email: 'admin@example.com', password: 'password', password_confirmation: 'password', role_id: r3.id })

Article.delete_all
p "Creating Article in database"
a1 = Article.create!({ title: 'Rayban Sunglasses', content: 'Stylish shades', category: 'Category A', user_id: u2.id })
a2 = Article.create!({ title: 'Gucci watch', content: 'Expensive timepiece', category: 'Category A', user_id: u2.id })
a3 = Article.create!({ title: 'Henri Lloyd Pullover', content: 'Classy knitwear', category: 'Category B', user_id: u3.id })
a4 = Article.create!({ title: 'Porsche socks', content: 'Cosy footwear', category: 'Category C', user_id: u3.id })
