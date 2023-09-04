# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Truncate and reset the id to the first time
ActiveRecord::Base.connection.execute('TRUNCATE TABLE users cascade;')
ActiveRecord::Base.connection.reset_pk_sequence!('users')

admin = User.create(email: "admin@gmail.com", password: "12345678", password_confirmation: "12345678", admin: true)
p "Create admin successfully"

client = User.create(email: "client@gmail.com", password: "12345678", password_confirmation: "12345678", user_type: 'client')
p "Create client successfully"

(1..10).each do |index|
  begin
    user = User.create(email: "example#{index}@gmail.com", password: "12345678", password_confirmation: "12345678")
    p "Create user successfully #{user.id}"
  rescue => e
    p e.inspect
  end
end
