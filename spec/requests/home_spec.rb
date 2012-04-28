require "spec_helper"

describe "GET /" do
  it "works" do
    visit root_url
    page.should have_content("Digital Media Map")
  end
end
