DEFAULT_PASSWORD = 123_456

namespace :dev do
  desc 'add default admin'
  task add_default_admin: :environment do
    Admin.create!(email: 'admin@email.com', password: DEFAULT_PASSWORD,
                  password_confirmation: DEFAULT_PASSWORD)
  end

  desc 'add extra admins'
  task add_extra_admins: :environment do
    10.times do |_admin|
      Admin.create!(email: Faker::Internet.email, password: DEFAULT_PASSWORD,
                    password_confirmation: DEFAULT_PASSWORD)
    end
  end
end
