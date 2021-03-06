require("spec_helper")

describe("the index path", {:type => :feature}) do
  it("lists all stores in the database") do
    test_store = Store.create({:name => "Test store"})
    visit('/')
    expect(page).to have_content("Test Store")
  end
end

describe("the add a store path", {:type => :feature}) do
  it("adds a store to the database") do
    visit('/')
    fill_in("store_name", :with => "Test store")
    click_button("Add Store")
    expect(page).to have_content("Test Store")
  end
end

describe("the delete a store path", {:type => :feature}) do
  it("deletes a store from the database") do
    test_store = Store.create({:name => "Test Store"})
    visit('/')
    click_link("Test Store")
    click_button("Delete Store")
    expect(page).to have_content("All Stores")
  end
end

describe("the edit a store's name path", {:type => :feature}) do
  it("udpates a store's name in the database") do
    test_store = Store.create({:name => "Test Store Name"})
    visit('/')
    click_link("Test Store Name")
    click_link("Edit Store Name")
    expect(page).to have_content("Update")
    fill_in("store_name", :with => "New Store Name")
    click_button("Update")
    expect(page).to have_content("New Store Name")
  end
end

describe("the add a brand to a store path", {:type => :feature}) do
  it("allows the user to add a brand to a store") do
    test_store = Store.create({:name => "Test Store"})
    test_brand = Brand.create({:name => "Test Brand"})
    visit('/')
    click_link("Test Store")
    select("Test Brand", :from => "brand")
    click_button("Add")
    expect(page).to have_content("Test Brand")
  end
end
