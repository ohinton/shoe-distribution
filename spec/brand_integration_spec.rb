require("spec_helper")

describe("the index path", {:type => :feature}) do
  it("lists all brands in the database") do
    test_brand = Brand.create({:name => "Test Brand"})
    visit('/')
    expect(page).to have_content("Test Brand")
  end
end

describe("the add a brand path", {:type => :feature}) do
  it("has a form to add a brand") do
    visit('/')
    fill_in("brand_name", :with => "Test Brand")
    click_button("Add Brand")
    expect(page).to have_content("Test Brand")
  end
end
