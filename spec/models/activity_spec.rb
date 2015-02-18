require 'rails_helper'

describe Activity do
  it { should have_and_belong_to_many(:users) }
  
  it 'is not being saved without a name'
  it 'will not be saved if there is a activity with the same name '

end
