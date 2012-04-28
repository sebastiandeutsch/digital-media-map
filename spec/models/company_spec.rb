require 'spec_helper'

describe Company do

  it { should belong_to :category }
  it { should have_many :taggings }
  it { should have_many(:tags).through(:taggings) }

  describe "private slug" do

    subject { Factory(:company, :private_slug => nil) }
    its(:private_slug) { should_not be_nil }

  end
end
