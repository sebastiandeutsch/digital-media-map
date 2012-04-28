require 'spec_helper'

describe Category do

  it { should have_many(:companies) }
  it { should have_many(:tags) }
  #it { should validate_presence_of(:name) }

end
