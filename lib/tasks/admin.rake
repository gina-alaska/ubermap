namespace :admin do
  desc "Make user admin"
  task :set => :environment do
    if ENV['EMAIL']
      u = User.where(email: ENV['EMAIL']).first
    else
      u = User.last
    end
    u.admin = true
    u.save!
  end
end
