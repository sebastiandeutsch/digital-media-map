require 'spec_helper'

describe Company do

  it { should belong_to :category }
  it { should have_many :taggings }
  it { should have_many(:tags).through(:taggings) }

end
