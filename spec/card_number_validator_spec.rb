require_relative '../lib/card_number_validator'

RSpec.describe "valid_card_number?" do
  context "valid card numbers" do
    it "accepts a 34-prefix number with no separators" do
      expect(valid_card_number?("341234567890123")).to be true
    end

    it "accepts a 37-prefix number with no separators" do
      expect(valid_card_number?("371234567890123")).to be true
    end

    it "accepts a 34-prefix number with dashes (4-6-5)" do
      expect(valid_card_number?("3412-345678-90123")).to be true
    end

    it "accepts a 37-prefix number with dashes (4-6-5)" do
      expect(valid_card_number?("3712-345678-90123")).to be true
    end

    it "accepts a 34-prefix number with spaces (4-6-5)" do
      expect(valid_card_number?("3412 345678 90123")).to be true
    end

    it "accepts a 37-prefix number with spaces (4-6-5)" do
      expect(valid_card_number?("3712 345678 90123")).to be true
    end
  end

  context "wrong prefix" do
    it "rejects a number starting with 4" do
      expect(valid_card_number?("411111111111111")).to be false
    end

    it "rejects a number starting with 5" do
      expect(valid_card_number?("511111111111111")).to be false
    end

    it "rejects a number starting with 38 (not 34 or 37)" do
      expect(valid_card_number?("381234567890123")).to be false
    end

    it "rejects a number starting with 30 (not 34 or 37)" do
      expect(valid_card_number?("301234567890123")).to be false
    end
  end

  context "wrong digit count" do
    it "rejects a bare number with 14 digits (too few)" do
      expect(valid_card_number?("34123456789012")).to be false
    end

    it "rejects a bare number with 16 digits (too many)" do
      expect(valid_card_number?("3412345678901234")).to be false
    end

    it "rejects a dashes format with too few digits" do
      expect(valid_card_number?("3412-345678-9012")).to be false
    end

    it "rejects a dashes format with too many digits" do
      expect(valid_card_number?("3412-345678-901234")).to be false
    end
  end

  context "wrong digit groupings" do
    it "rejects a dashes format with 4-5-6 grouping instead of 4-6-5" do
      expect(valid_card_number?("3412-34567-890123")).to be false
    end

    it "rejects a dashes format with 5-5-5 grouping instead of 4-6-5" do
      expect(valid_card_number?("34123-45678-90123")).to be false
    end

    it "rejects a spaces format with 4-4-4-3 grouping" do
      expect(valid_card_number?("3412 3456 7890 123")).to be false
    end
  end

  context "mixed or invalid separators" do
    it "rejects mixed separators (dash then space)" do
      expect(valid_card_number?("3412-345678 90123")).to be false
    end

    it "rejects dot separators" do
      expect(valid_card_number?("3412.345678.90123")).to be false
    end

    it "rejects slash separators" do
      expect(valid_card_number?("3412/345678/90123")).to be false
    end
  end

  context "invalid characters" do
    it "rejects a number with a letter in the body" do
      expect(valid_card_number?("341234567890X23")).to be false
    end

    it "rejects a number with a special character" do
      expect(valid_card_number?("34123456789012!")).to be false
    end
  end

  context "edge cases" do
    it "rejects an empty string" do
      expect(valid_card_number?("")).to be false
    end

    it "rejects nil input" do
      expect(valid_card_number?(nil)).to be false
    end

    it "rejects a valid number embedded in surrounding text" do
      expect(valid_card_number?("Card: 341234567890123")).to be false
    end

    it "rejects a valid number with leading whitespace" do
      expect(valid_card_number?(" 341234567890123")).to be false
    end

    it "rejects a valid number with trailing whitespace" do
      expect(valid_card_number?("341234567890123 ")).to be false
    end

    it "rejects a valid number followed by a newline and more text" do
      expect(valid_card_number?("341234567890123\nextra")).to be false
    end
  end
end
