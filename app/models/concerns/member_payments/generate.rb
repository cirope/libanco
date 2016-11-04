module MemberPayments::Generate
  extend ActiveSupport::Concern

  module ClassMethods
    def generate
      mtoday = Date.today.mday
      mdays = mtoday == Date.today.end_of_month.mday ? Array(mtoday..31) : [mtoday]

      mdays.each do |mday|
        Customer.members.where('starting_day = ?', mday).each do |customer|
          customer.member_payments.create!(
            amount: customer.card.monthly_fee.to_f, expire_at: 1.month.from_now.to_date
          )
        end
      end
    end
  end
end
