# Sanity check that mysql db was seeded

RSpec.describe "seeding" do
  describe "customers table" do
    it "has a known row" do
      result = mysql.query "SELECT * FROM classicmodels.customers WHERE customerName = 'Baane Mini Imports'"
      expect(result.first["country"].to_s).to eq "Norway"
    end
  end
end
