require("spec_helper")

describe(Brand) do
  it("validates the presence of name") do
    brand = Brand.new({:name => ''})
    expect(brand.save()).to(eq(false))
  end

  it("ensures the length of name is at most 50 characters") do
    brand = Brand.new({:name => "a".*(51)})
    expect(brand.save()).to(eq(false))
  end

  it("converts the name to titlecase") do
    brand = Brand.create({:name => "test name"})
    expect(brand.name()).to(eq("Test Name"))
  end

  describe("#stores") do
    it("tells which stores a brand is sold at") do
      test_brand = Brand.create({:name => "Test Brand"})
      test_store1 = Store.create({:name => "Test Store 1"})
      test_store2 = Store.create({:name => "Test Store 2"})
      test_store1.brands.push(test_brand)
      test_store2.brands.push(test_brand)
      expect(test_brand.stores()).to(eq([test_store1, test_store2]))
    end
  end

end
