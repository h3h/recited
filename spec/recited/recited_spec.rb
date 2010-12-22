require 'spec_helper'

describe Recited, "time_diff_in_words" do

  before(:all) do
    # Tuesday, November 9th, 2010 at 4:32pm; 2 days, 14 hours after DST change
    @base_time = Time.mktime(2010, 11, 9, 16, 32)
  end

  describe "in the past" do
    describe "day cases" do
      it "works for today" do
        t = @base_time
        Recited.time_diff_in_words(t, @base_time).should == "4:32pm"
      end

      it "works for yesterday" do
        t = @base_time - 1.day
        Recited.time_diff_in_words(t, @base_time).
          should == "yesterday at 4:32pm"
      end

      it "works for 2 days ago (current week)" do
        t = @base_time - 2.days
        Recited.time_diff_in_words(t, @base_time).
          should == "Sunday at 4:32pm"
      end

      it "works for 4 days ago (last week)" do
        t = @base_time - 4.days
        Recited.time_diff_in_words(t, @base_time).
          should == "last Friday at 4:32pm"
      end

      it "works for 7 days ago" do
        t = @base_time - 7.days
        Recited.time_diff_in_words(t, @base_time).
          should == "a week ago at 4:32pm"
      end

      it "works for 9 days ago" do
        t = @base_time - 9.days
        Recited.time_diff_in_words(t, @base_time).
          should == "9 days ago at 4:32pm"
      end

      it "works for 10 days ago" do
        t = @base_time - 10.days
        Recited.time_diff_in_words(t, @base_time).
          should == "10 days ago at 4:32pm"
      end
    end

    describe "week cases" do
      it "works for 11 days ago" do
        t = @base_time - 11.days
        Recited.time_diff_in_words(t, @base_time).
          should == "a week and a half ago"
      end

      it "works for 12 days ago" do
        t = @base_time - 12.days
        Recited.time_diff_in_words(t, @base_time).
          should == "about a week and a half ago"
      end

      it "works for 13 days ago" do
        t = @base_time - 13.days
        Recited.time_diff_in_words(t, @base_time).should == "about 2 weeks ago"
      end

      it "works for 14 days ago" do
        t = @base_time - 14.days
        Recited.time_diff_in_words(t, @base_time).should == "2 weeks ago"
      end

      it "works for 15 days ago" do
        t = @base_time - 15.days
        Recited.time_diff_in_words(t, @base_time).should == "about 2 weeks ago"
      end

      it "works for 16 days ago" do
        t = @base_time - 16.days
        Recited.time_diff_in_words(t, @base_time).should == "about 2 weeks ago"
      end

      it "works for 17 days ago" do
        t = @base_time - 17.days
        Recited.time_diff_in_words(t, @base_time).
          should == "about 2 and a half weeks ago"
      end

      it "works for 18 days ago" do
        t = @base_time - 18.days
        Recited.time_diff_in_words(t, @base_time).
          should == "2 and a half weeks ago"
      end

      it "works for 19 days ago" do
        t = @base_time - 19.days
        Recited.time_diff_in_words(t, @base_time).
          should == "about 2 and a half weeks ago"
      end

      it "works for 20 days ago" do
        t = @base_time - 20.days
        Recited.time_diff_in_words(t, @base_time).
          should == "about 3 weeks ago"
      end
    end

    describe "month cases" do
      it "works for a month ago - 2 days" do
        t = @base_time.change(:month => @base_time.month - 1) - 2.days
        Recited.time_diff_in_words(t, @base_time).should == "about a month ago"
      end

      it "works for a month ago - 1 day" do
        t = @base_time.change(:month => @base_time.month - 1) - 1.days
        Recited.time_diff_in_words(t, @base_time).should == "about a month ago"
      end

      it "works for a month ago" do
        t = @base_time.change(:month => @base_time.month - 1)
        Recited.time_diff_in_words(t, @base_time).should == "a month ago"
      end

      it "works for a month ago + 1 day" do
        t = @base_time.change(:month => @base_time.month - 1) + 1.days
        Recited.time_diff_in_words(t, @base_time).should == "about a month ago"
      end

      it "works for a month ago + 2 days" do
        t = @base_time.change(:month => @base_time.month - 1) + 2.days
        Recited.time_diff_in_words(t, @base_time).should == "about a month ago"
      end

      it "works for two months ago" do
        t = @base_time.change(:month => @base_time.month - 2)
        Recited.time_diff_in_words(t, @base_time).should == "2 months ago"
      end

      it "works for 2 months ago + 2 days" do
        t = @base_time.change(:month => @base_time.month - 2) + 2.days
        Recited.time_diff_in_words(t, @base_time).should == "about 2 months ago"
      end

      xit "works for 2 and a half months ago" do
        t = @base_time.months_ago(2) - 15.days
        Recited.time_diff_in_words(t, @base_time).
          should == "2 and a half months ago"
      end

      it "works for 18 months ago" do
        t = @base_time.change(
          :month => @base_time.month - 6,
          :year => @base_time.year - 1
        )
        Recited.time_diff_in_words(t, @base_time).should == "18 months ago"
      end
    end

    describe "year cases" do
      it "works for 1 year ago" do
        t = @base_time.change(:year => @base_time.year - 1)
        Recited.time_diff_in_words(t, @base_time).should == "1 year ago"
      end

      it "works for 2 years ago" do
        t = @base_time.change(:year => @base_time.year - 2)
        Recited.time_diff_in_words(t, @base_time).should == "2 years ago"
      end

      xit "works for 2 years ago - 15 days" do
        t = @base_time.change(:year => @base_time.year - 2) - 15.days
        Recited.time_diff_in_words(t, @base_time).should == "about 2 years ago"
      end
    end

    describe "million year cases" do

    end

    describe "billion year cases" do

    end
  end

end
