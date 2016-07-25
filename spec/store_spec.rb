require("spec_helper")

describe(Store) do
  it("validates the presence of name") do
    store = Store.new({:name => ''})
    expect(store.save()).to(eq(false))
  end

  it("ensures the length of name is at most 50 characters") do
    store = Store.new({:name => "a".*(51)})
    expect(store.save()).to(eq(false))
  end

  it("converts the name to titlecase") do
    store = Store.create({:name => "test name"})
    expect(store.name()).to(eq("Test Name"))
  end

  describe("#brands") do
    it("tells which brands a store sells") do
      test_store = Store.create({:name => "Test Store"})
      test_brand1 = Brand.create({:name => "Test Brand 1"})
      test_brand2 = Brand.create({:name => "Test Brand 2"})
      test_brand1.stores.push(test_store)
      test_brand2.stores.push(test_store)
      expect(test_store.brands()).to(eq([test_brand1, test_brand2]))
    end
  end

end
