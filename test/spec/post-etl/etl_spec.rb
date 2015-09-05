RSpec.describe "etl" do
  describe "postgres users table" do
    it "successfully filters out rows with NULL salesRepEmployeeNumber" do
      customer_to_filter = mysql.query("SELECT * FROM classicmodels.customers WHERE salesRepEmployeeNumber IS NULL").first["customerName"]
      expect(customer_to_filter.to_s).to_not be_empty

      result = pg.exec("SELECT * FROM users WHERE customerName = '#{customer_to_filter}'").first
      expect(result).to be_nil
    end
  end
end
