DEFAULT_PASSWORD = 123_456

namespace :dev do
  desc 'add default users'
  task add_default_user: :environment do
    User.create!(email: 'user@email.com', password: DEFAULT_PASSWORD,
                 password_confirmation: DEFAULT_PASSWORD)
  end

  desc 'add extra users'
  task add_extra_users: :environment do
    10.times do |_user|
      User.create!(email: Faker::Internet.email, password: DEFAULT_PASSWORD,
                   password_confirmation: DEFAULT_PASSWORD)
    end
  end
end
