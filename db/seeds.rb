Apartment::Tenant.switch! 'public'
account = Account.find_by subdomain: 'admin'

Apartment::Tenant.switch! 'admin'

User.create!(
  name: 'Admin',
  lastname: 'Istrator',
  email: 'admin@libanco.com',
  password: '123456',
  password_confirmation: '123456',
  roles: :admin,
  account: account
)
