require 'spec_helper'

describe Recited, "time_diff_in_words" do

  before(:all) do
    # Tuesday, November 9th, 2010 at 4:32pm; 2 days, 14 hours after DST change
    @base_time = Time.mktime(2010, 11, 9, 16, 32)
  end

  describe "in the past" do
    it "works for today" do
      t = @base_time
      Recited.time_diff_in_words(t, @base_time).should == "4:32pm"
    end

    it "works for yesterday" do
      t = @base_time - 1.day
      Recited.time_diff_in_words(t, @base_time).should == "yesterday at 4:32pm"
    end

    it "works for 2 days ago (current week)" do
      t = @base_time - 2.days
      Recited.time_diff_in_words(t, @base_time).should == "Sunday at 4:32pm"
    end

    it "works for 4 days ago (last week)" do
      t = @base_time - 4.days
      Recited.time_diff_in_words(t, @base_time).
        should == "last Friday at 4:32pm"
    end

    it "works for 7 days ago" do
      t = @base_time - 7.days
      Recited.time_diff_in_words(t, @base_time).should == "a week ago at 4:32pm"
    end

    it "works for 9 days ago" do
      t = @base_time - 9.days
      Recited.time_diff_in_words(t, @base_time).should == "9 days ago at 4:32pm"
    end

    it "works for 10 days ago" do
      t = @base_time - 10.days
      Recited.time_diff_in_words(t, @base_time).
        should == "10 days ago at 4:32pm"
    end

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
      Recited.time_diff_in_words(t, @base_time).should == "about two weeks ago"
    end

    it "works for 14 days ago" do
      t = @base_time - 14.days
      Recited.time_diff_in_words(t, @base_time).should == "two weeks ago"
    end
  end

end
