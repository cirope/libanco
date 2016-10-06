require 'test_helper'

class NotifierMailerTest < ActionMailer::TestCase
  setup do
    @reminder = reminders :default
  end

  test 'remind' do
    mail = NotifierMailer.remind(@reminder.account.subdomain, @reminder.id)

    assert_enqueued_emails 1 do
      mail.deliver_later
    end

    assert_equal I18n.t('notifier_mailer.remind.subject'), mail.subject
    assert_equal [@reminder.user_email], mail.to
    assert_equal [ENV['EMAIL_ADDRESS']], mail.from
    assert_match @reminder.description, mail.text_part.body.decoded
    assert_match @reminder.description, mail.html_part.body.decoded
  end

  test 'summary' do
    user = @reminder.user
    schedule = @reminder.schedule

    mail = NotifierMailer.summary(@reminder.account.subdomain, user.id)

    assert_enqueued_emails 1 do
      mail.deliver_later
    end

    assert_equal I18n.t('notifier_mailer.summary.subject'), mail.subject
    assert_equal [user.email], mail.to
    assert_equal [ENV['EMAIL_ADDRESS']], mail.from
    assert_match schedule.description, mail.text_part.body.decoded
    assert_match schedule.description, mail.html_part.body.decoded
  end
end
