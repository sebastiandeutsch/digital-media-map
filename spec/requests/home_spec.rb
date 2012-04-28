require "spec_helper"

describe "GET /" do
  it "works" do
    visit root_url
    page.should have_content("Move along")
  end
end
