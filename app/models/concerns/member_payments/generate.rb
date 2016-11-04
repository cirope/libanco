module MemberPayments::Generate
  extend ActiveSupport::Concern

  module ClassMethods
    def generate
      mtoday = 30 #Date.today.mday
      mdays = mtoday == Date.today.end_of_month.mday ? Array(mtoday..31) : [mtoday]

      mdays.each do |mday|
        expire_at = (Time.now.beginning_of_month + (mday-1).days) + 1.month

        Customer.members.where('starting_day = ?', mday).each do |customer|
          customer.member_payments.create!(
            amount: customer.card.monthly_fee.to_f, expire_at: expire_at.to_date
          )
        end
      end
    end
  end
end
