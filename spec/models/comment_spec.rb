require 'rails_helper'

describe Comment do

  it { should belong_to(:user) }
  it { should belong_to(:activity) }
  it { should validate_length_of(:content).is_at_most(140) }
  it { should validate_length_of(:content).is_at_least(1) }

end
