require 'csv'
require 'date'
namespace :hexlet do
  desc "TODO"
  task import_users: :environment do
    CSV.foreach("test/fixtures/files/users.csv",headers: true) do |row|
      user_params = {
        first_name: row[0],
        last_name: row[1],
        birthday: Date.strptime(row[2], "%m/%d/%Y"),
        email: row[3]
      }
      User.create!(user_params)
    end
  end
end
