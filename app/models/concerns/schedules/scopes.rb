module Schedules::Scopes
  extend ActiveSupport::Concern

  module ClassMethods
    def find_by_day date
      where scheduled_at: date.to_time.all_day
    end

    def min_datetime
      20.minutes.from_now
    end

    def find_by_month date
      utc_offset = Time.zone.utc_offset
      operator = utc_offset > 0 ? '+' : '-'
      utc_corrector = "#{operator} interval '#{utc_offset.abs} seconds'"

      where(scheduled_at: date.to_time.all_month).pluck(
        "TO_CHAR(#{table_name}.scheduled_at #{utc_corrector}, 'yyyy/mm/dd')"
      )
    end
  end
end
