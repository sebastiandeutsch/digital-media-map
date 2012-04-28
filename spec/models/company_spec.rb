require 'spec_helper'

describe Company do

  it { should belong_to :category }
  it { should have_and_belong_to_many :tags }

end
