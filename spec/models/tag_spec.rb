require 'spec_helper'

describe Tag do
  it { should have_many(:taggings) }
  it { should belong_to(:category) }
end
