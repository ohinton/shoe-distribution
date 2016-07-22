require("spec_helper")

describe("the index path", {:type => :feature}) do
  it("lists all stores in the database") do
    test_store = Store.create({:name => "Test Store"})
    visit('/')
    expect(page).to have_content("Test Store")
  end
end

describe("the add a store path", {:type => :feature}) do
  it("adds a store to the database") do
    visit('/')
    fill_in("store_name", :with => "Test Store")
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
