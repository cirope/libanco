namespace :reminders do
  desc 'Send email reminders'
  task send: :environment do
    Apartment::Tenant.switch! 'public'

    Account.all.each do |account|
      Apartment::Tenant.switch! account.subdomain
      ::Reminder.send_reminders account.subdomain
    end
  end

  desc 'Send email summaries'
  task send_summaries: :environment do
    Apartment::Tenant.switch! 'public'

    Account.all.each do |account|
      Apartment::Tenant.switch! account.subdomain
      ::Reminder.send_summaries account.subdomain
    end
  end
end
