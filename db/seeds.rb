if User.where(admin: true).empty?
  print 'Creating admin...'
  User.create!(email: 'admin@gotimevault.com',
               password: Rails.application.secrets.default_admin_password,
               password_confirmation: Rails.application.secrets.default_admin_password,
               phone_number: '5555555555',
               admin: true)
  puts 'done'
end
