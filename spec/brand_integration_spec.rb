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
    fill_in("brand_name", :with => "Test brand")
    click_button("Add Brand")
    expect(page).to have_content("Test Brand")
  end
end

describe("the delete a brand path", {:type => :feature}) do
  it("deletes a brand from the database") do
    test_brand = Brand.create({:name => "Test Brand"})
    visit('/')
    click_link("Test Brand")
    click_button("Delete Brand")
    expect(page).to have_content("All Brands")
  end
end

describe("the edit a brands's name path", {:type => :feature}) do
  it("udpates a brands's name in the database") do
    test_brand = Brand.create({:name => "Test Brand Name"})
    visit('/')
    click_link("Test Brand Name")
    click_link("Edit Brand Name")
    expect(page).to have_content("Update")
    fill_in("brand_name", :with => "New Brand Name")
    click_button("Update")
    expect(page).to have_content("New Brand Name")
  end
end

describe("the add a store to a brand path", {:type => :feature}) do
  it("allows the user to add a store to a brand") do
    test_store = Store.create({:name => "Test Store"})
    test_brand = Brand.create({:name => "Test Brand"})
    visit('/')
    click_link("Test Brand")
    select("Test Store", :from => "store")
    click_button("Add")
    expect(page).to have_content("Test Store")
  end
end
