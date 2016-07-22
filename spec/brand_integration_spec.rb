require("spec_helper")

describe("the index path", {:type => :feature}) do
  it("lists all brands in the database") do
    test_brand = Brand.create({:name => "Test Brand"})
    visit('/')
    expect(page).to have_content("Test Brand")
  end
end
