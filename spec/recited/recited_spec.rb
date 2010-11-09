require 'spec_helper'

describe Recited, "time_diff_in_words" do

  before(:all) do
    # Tuesday, November 9th, 2010 at 4:32pm; 2 days, 14 hours after DST change
    @base_time = Time.mktime(2010, 11, 9, 16, 32)
  end

  describe "in the past" do
    it "works for today" do
      t = @base_time
      Recited.time_diff_in_words(t).should == "4:32pm"
    end

    it "works for yesterday" do
      t = @base_time - 1.day
      Recited.time_diff_in_words(t).should == "yesterday at 4:32pm"
    end

    it "works for 2 days ago (current week)" do
      t = @base_time - 2.days
      Recited.time_diff_in_words(t).should == "Sunday at 4:32pm"
    end

    it "works for 4 days ago (last week)" do
      t = @base_time - 4.days
      Recited.time_diff_in_words(t).should == "last Friday at 5:32pm"
    end

    it "works for 7 days ago" do
      t = @base_time - 7.days
      Recited.time_diff_in_words(t).should == "a week ago at 5:32pm"
    end
  end

end
