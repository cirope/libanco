namespace :member_payments do
  desc 'Member payments generate'
  task send: :environment do
    Apartment::Tenant.switch! 'public'

    Account.all.each do |account|
      Apartment::Tenant.switch! account.subdomain
      ::MemberPayment.generate
    end
  end
end
