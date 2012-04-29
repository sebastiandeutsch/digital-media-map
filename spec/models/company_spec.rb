require 'spec_helper'

describe Company do

  it { should belong_to :category }
  it { should have_many :taggings }
  it { should have_many(:tags).through(:taggings) }

  describe "when saved" do
    context "and found via geo service" do
      use_vcr_cassette "company-query-for-lonlat-success"

      subject { Factory(:company, :lat => nil, :lon => nil, :not_found => nil) }

      its(:lat)       { should_not be_nil }
      its(:lon)       { should_not be_nil }
      its(:not_found) { should be_false }
    end

    context "and not found via geo service" do
      use_vcr_cassette "company-query-for-lonlat-not-found"

      subject { Factory(:company, :city => "RockHeaven", :lat => nil, :lon => nil, :not_found => nil) }

      its(:lat)       { should be_nil }
      its(:lon)       { should be_nil }
      its(:not_found) { should be_true }
    end
  end

  describe "#insert_private_slug" do
    subject { Factory(:company, :private_slug => nil) }
    its(:private_slug) { should_not be_nil }
  end

end
