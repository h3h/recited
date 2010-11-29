require 'active_support/time'

module Recited

  def self.time_diff_in_words(time_a, time_b=Time.now)
    time_string = time_a.strftime("%I:%M%p").downcase.gsub(/^0/, '') # 4:32pm
    date_a, date_b = [time_a, time_b].map {|t| t.to_date}
    diff_days = (date_b - date_a).to_i
    mod_weeks = diff_days % 7
    diff_weeks = diff_days / 7
    #puts "\n\n!!!! time_a: #{time_a.to_s}; time_b: #{time_b.to_s}; diff: #{diff_days}\n\n"
    if diff_days == 0
      time_string
    elsif diff_days == 1
      "yesterday at #{time_string}"
    elsif diff_days < 7 && date_a.wday < date_b.wday
      "#{time_a.strftime("%A")} at #{time_string}"
    elsif diff_days < 7 && date_a.wday >= date_b.wday
      "last #{time_a.strftime("%A")} at #{time_string}"
    elsif diff_days == 7
      "a week ago at #{time_string}"
    elsif diff_days <= 10
      "#{diff_days} days ago at #{time_string}"
    elsif diff_weeks == 1
      case mod_weeks
      when 4
        "a week and a half ago"
      when 5
        "about a week and a half ago"
      when 6
        "about two weeks ago"
      end
    elsif diff_weeks < 7
      case mod_weeks
      when 0
        "#{diff_weeks} weeks ago"
      when 1, 2
        "about #{diff_weeks} weeks ago"
      when 4
        "#{diff_weeks} and a half weeks ago"
      when 3, 5
        "about #{diff_weeks} and a half weeks ago"
      when 6
        "about #{diff_weeks + 1} weeks ago"
      end
    end
  end

end
