Recited
=======

# Description

A simple library that will generate text for describing a time in the past or
future as a human would. It fills essentially the same gap as Rails's
[`time_ago_in_words`][1], but aims to be much better at its job and much
easier to integrate into normal sentences.

 [1]: http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-time_ago_in_words

# Examples

Most other libraries are either like robots:

    >> time_ago_in_words(3.weeks.ago - 3.days - 4.hours)
    => "24 days"

Or just flat-out wrong:

    >> time_ago_in_words(1.year.ago - 6.months - 4.days)
    => "about 1 year"

Recited will give you something that you can say out loud without embarrassing
yourself:

    >> Recited.time_diff_in_words(3.weeks.ago - 3.days - 4.hours)
    => "about 3 and a half weeks ago"

    >> Recited.time_diff_in_words(1.year.ago - 6.months - 4.days)
    => "about a year and a half ago"

    >> Recited.time_diff_in_words(1.year.ago - 2.months + 10.days)
    => "almost 14 months ago"
