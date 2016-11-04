module MemberPayments::Generate
  extend ActiveSupport::Concern

  module ClassMethods
    def generate
      today = Date.today
      mdays = today.mday == today.end_of_month.mday ? Array(today.mday..31) : [today.mday]

      mdays.each do |mday|
        expire_at = today.next_month.change(day: mday) rescue today.next_month

        Customer.members.where('starting_day = ?', mday).each do |customer|
          customer.member_payments.create!(
            amount: customer.card.monthly_fee.to_f, expire_at: expire_at
          )
        end
      end
    end
  end
end
