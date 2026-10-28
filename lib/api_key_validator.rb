# Validates whether a string is a valid API key.
#
# A valid API key must satisfy all of the following:
# - Starts with the prefix sk-
# - Is followed by exactly 32 alphanumeric characters (letters and digits only)
# - Contains at least one uppercase letter in the key body
# - Contains at least one digit in the key body
# - Contains at least one lowercase letter in the key body
# - Has no spaces or special characters anywhere in the key body
#
# Returns true if the key meets all requirements, false otherwise.
# Returns false for nil input.
#
# Examples:
#   valid_api_key?("sk-Abcdefghijklmnopqrstuvwxyz123456")  #=> true
#   valid_api_key?("sk-A1bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb")  #=> true
#   valid_api_key?("ak-Abcdefghijklmnopqrstuvwxyz123456")  #=> false (wrong prefix)
#   valid_api_key?("sk-abcdefghijklmnopqrstuvwxyz123456")  #=> false (no uppercase)
#   valid_api_key?("sk-Abcdefghijklmnopqrstuvwxyz12345")   #=> false (only 31 chars)
#   valid_api_key?(nil)                                    #=> false
def valid_api_key?(key)
  # TODO: Implement API key validation using regex
end
