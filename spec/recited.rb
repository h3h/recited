require 'spec_helper'

describe Recited, "time_diff_in_words" do

  include ActiveSupport::NumberHelpers

  it "works for today" do
    t = 2.hours.ago
    Recited.time_diff_in_words(t).should == "7:35am"
  end

end
