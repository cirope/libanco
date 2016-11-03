module MemberPayments::Generate
  extend ActiveSupport::Concern

  module ClassMethods
    def generate
      options = {}

      Customer.where(starting_day: Date.today.mday).each do |customer|
      end
    end
  end
end
