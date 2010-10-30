require 'spec_helper'
require 'active_support/core_ext/numeric/time'

describe Recited, "time_diff_in_words" do

  it "works for today" do
    t = 2.hours.ago
    Recited.time_diff_in_words(t).should == "7:35am"
  end

end
