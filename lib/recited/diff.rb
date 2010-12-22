require 'active_support/time'

module Recited

  def self.time_diff_in_words(time_a, time_b=Time.now)
    time_string = time_a.strftime("%I:%M%p").downcase.gsub(/^0/, '') # 4:32pm
    date_a, date_b = [time_a, time_b].map {|t| t.to_date}
    diff_days = (date_b - date_a).to_i
    mod_weeks = diff_days % 7
    diff_weeks = diff_days / 7

    if diff_weeks > 3
      diff_years = date_b.year - date_a.year
      diff_months = diff_years * 12 + (date_b.month - date_a.month)
      mb0 = time_b.months_ago(diff_months)
      mb1 = time_b.months_ago(diff_months + 1)
      mid_month = mb0 - 15.days

      if (time_b.day == time_a.day) && (time_b.month == time_a.month)
        "#{diff_years == 1 ? '1 year' : "#{diff_years} years"} ago"
      elsif diff_months == 1 && (time_b.day == time_a.day)
        "a month ago"
      elsif diff_months <= 18 && (time_b.day == time_a.day)
        "#{diff_months} months ago"
      elsif (mb1 + 2.days) >= time_a && time_a >= (mb1 - 2.days)
        months = (diff_months + 1) > 1 ? "#{diff_months + 1} months" : 'a month'
        "about #{months} ago"
      elsif (mb0 - 2.days) <= time_a && time_a <= (mb0 + 2.days)
        months = diff_months > 1 ? "#{diff_months} months" : 'a month'
        "about #{months} ago"
      elsif (mid_month + 1.day) >= time_a && (mid_month - 1.day) <= time_a
        "#{diff_months} and a half months ago"
      elsif (mid_month + 7.days) >= time_a && (mid_month - 7.days) <= time_a
        "about #{diff_months} and a half months ago"
      else
        "not done"
      end
    elsif diff_days == 0
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
        "about 2 weeks ago"
      end
    elsif diff_weeks <= 6
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
