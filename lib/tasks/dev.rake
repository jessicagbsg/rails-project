namespace :dev do
  desc 'setup development environment'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Dropping DB...') { `rails db:drop` }
      show_spinner('Creating DB...') { `rails db:create` }
      show_spinner('Migrating DB...') { `rails db:migrate` }
      show_spinner('Creating default Admin...') { `rails dev:add_default_admin` }
      show_spinner('Creating extra Admins...') { `rails dev:add_extra_admins` }
      show_spinner('Creating default User...') { `rails dev:add_default_user` }
      show_spinner('Creating extra Users...') { `rails dev:add_extra_users` }
    else
      puts "You're not in development mode"
    end
  end

  private

  def show_spinner(msg_start, msg_end = 'Completed!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success(msg_end)
  end
end
