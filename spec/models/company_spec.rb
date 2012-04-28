require 'spec_helper'

describe Company do

  it { should belong_to :category }
  it { should have_and_belong_to_many :tags }


  describe "Tag names" do

    subject {
      company = Factory(:company)
      company.tags = [Tag.create(:name => "foo")]
      company.save
    }
    its(:tag_names) { should eql(["foo"])}
  end
end
