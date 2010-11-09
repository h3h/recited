require 'active_support/time'

module Recited

  def self.time_diff_in_words(time)
    time_string = time.strftime("%I:%M%p").downcase.gsub(/^0/, '')
    date = time.to_date
    today = Date.today
    diff_days = today - date
    puts "time: #{time.to_s}; diff: #{diff_days}"
    if diff_days == 0
      time_string
    elsif diff_days = 1
      "yesterday at #{time_string}"
    elsif diff_days < 7 && date.wday < today.wday
      "#{time.strftime("%A")} at #{time_string}"
    end
  end

end
