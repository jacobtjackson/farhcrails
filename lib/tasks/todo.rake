namespace :todo do
  desc "mark users that haven't logged in for 30 days as unapproved"
  task inactive_users: :environment do
    User.where("last_sign_in_at <= ?", Time.now.to_date - 30.days).update_all(approved: false)
  end

end
