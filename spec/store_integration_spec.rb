require("spec_helper")

describe("the index path", {:type => :feature}) do
  it("lists all stores in the database") do
    test_store = Store.create({:name => "Test Store"})
    visit('/')
    expect(page).to have_content("Test Store")
  end
end
