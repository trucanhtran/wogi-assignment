# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
[1..10].each do |index|
  begin
    user = User.create(email: "example#{index}@gmail.com", password: "12345678", password_confirmation: "12345678")
    p "Create user successfully #{user.id}"
  rescue => e
    p e.inspect
  end
end
