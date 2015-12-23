# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'test@test.com', password: '12345678', password_confirmation: '12345678')
user = User.create(email: 'example@test.com', password: '12345678', password_confirmation: '12345678')

user.tasks.create(name: 'Consequatur minima exercitationem quibusdam est magni qui cupiditate.', description: 'Nemo reprehenderit repudiandae dicta qui tenetur. Architecto et natus soluta incidunt modi rerum officiis. Omnis sunt repudiandae aliquam consectetur. Eum voluptatem et libero ad qui vero. Aliquam accusamus inventore et laudantium velit occaecati voluptas.' )
user.tasks.create(name: 'Velit sapiente deleniti ratione earum.', description: 'Totam quia omnis saepe aut tempore nemo. Consequatur laboriosam commodi. Et animi eligendi deserunt iusto consequuntur sunt optio. In sit possimus autem dolorem. Voluptate sed aut deleniti eius est.', state: :started)
