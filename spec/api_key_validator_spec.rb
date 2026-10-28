require_relative '../lib/api_key_validator'

RSpec.describe "valid_api_key?" do
  context "valid keys" do
    it "accepts a key with all requirements met" do
      expect(valid_api_key?("sk-Abcdefghijklmnopqrstuvwxyz123456")).to be true
    end

    it "accepts a key with uppercase, lowercase, and digit at the start of the body" do
      expect(valid_api_key?("sk-A1bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb")).to be true
    end

    it "accepts a key with uppercase and digit at the end of the body" do
      expect(valid_api_key?("sk-bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbA1")).to be true
    end

    it "accepts a key with digit at the start of the body" do
      expect(valid_api_key?("sk-1bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbA")).to be true
    end

    it "accepts a key with multiple uppercase letters, digits, and lowercase letters" do
      expect(valid_api_key?("sk-ABCDEFGHIJKLMNOP1234abcdefghijkl")).to be true
    end
  end

  context "wrong or missing prefix" do
    it "rejects a key with the wrong prefix letter" do
      expect(valid_api_key?("ak-Abcdefghijklmnopqrstuvwxyz123456")).to be false
    end

    it "rejects a key with an underscore separator instead of a dash" do
      expect(valid_api_key?("sk_Abcdefghijklmnopqrstuvwxyz123456")).to be false
    end

    it "rejects a key with no prefix at all" do
      expect(valid_api_key?("Abcdefghijklmnopqrstuvwxyz1234567")).to be false
    end

    it "rejects a key with only the prefix and no body" do
      expect(valid_api_key?("sk-")).to be false
    end
  end

  context "wrong body length" do
    it "rejects a key with 31 characters in the body (too short)" do
      expect(valid_api_key?("sk-Abcdefghijklmnopqrstuvwxyz12345")).to be false
    end

    it "rejects a key with 33 characters in the body (too long)" do
      expect(valid_api_key?("sk-Abcdefghijklmnopqrstuvwxyz1234567")).to be false
    end
  end

  context "missing required character types" do
    it "rejects a key with no uppercase letter in the body" do
      expect(valid_api_key?("sk-abcdefghijklmnopqrstuvwxyz123456")).to be false
    end

    it "rejects a key with no lowercase letter in the body" do
      expect(valid_api_key?("sk-ABCDEFGHIJKLMNOPQRSTUVWXYZ123456")).to be false
    end

    it "rejects a key with no digit in the body" do
      expect(valid_api_key?("sk-ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef")).to be false
    end
  end

  context "invalid characters in the body" do
    it "rejects a key with a special character in the body" do
      expect(valid_api_key?("sk-Abcdefghijklmnopqrstuvwxyz12345!")).to be false
    end

    it "rejects a key with a space in the body" do
      expect(valid_api_key?("sk-Abcdefghijklmnopqrstuvwxy 12345")).to be false
    end

    it "rejects a key with a hyphen in the body" do
      expect(valid_api_key?("sk-Abcdefghijklmnopqrstuvwxyz1234-")).to be false
    end
  end

  context "edge cases" do
    it "rejects an empty string" do
      expect(valid_api_key?("")).to be false
    end

    it "rejects nil input" do
      expect(valid_api_key?(nil)).to be false
    end

    it "rejects a valid key embedded in surrounding text" do
      expect(valid_api_key?("key: sk-Abcdefghijklmnopqrstuvwxyz123456")).to be false
    end

    it "rejects a valid key with leading whitespace" do
      expect(valid_api_key?(" sk-Abcdefghijklmnopqrstuvwxyz123456")).to be false
    end

    it "rejects a valid key with trailing whitespace" do
      expect(valid_api_key?("sk-Abcdefghijklmnopqrstuvwxyz123456 ")).to be false
    end

    it "rejects a valid key followed by a newline and more text" do
      expect(valid_api_key?("sk-Abcdefghijklmnopqrstuvwxyz123456\nextra")).to be false
    end
  end
end
