class NotifierMailer < ApplicationMailer
  def remind subdomain, reminder_id
    Apartment::Tenant.switch! subdomain
    @reminder = Reminder.find reminder_id

    mail to: @reminder.user_email
  end

  def summary subdomain, user_id
    Apartment::Tenant.switch! subdomain
    @user = User.find user_id
    @schedules = @user.schedules.for_tomorrow

    mail to: @user.email
  end
end
