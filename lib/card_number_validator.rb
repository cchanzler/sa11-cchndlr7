# Validates whether a string is a valid credit card number.
#
# Accepts credit card numbers with 15 digits that start with 34 or 37
# in exactly three formats:
# 1. 341234567890123 — no separators
# 2. 3412-345678-90123 — groups of 4-6-5, separated by dashes
# 3. 3412 345678 90123 — groups of 4-6-5, separated by spaces
#
# Reject all other inputs including:
# - Wrong prefix (e.g., starts with 4 or 5)
# - Mixed separators (e.g., 3412-345678 90123)
# - Wrong digit groupings (e.g., 3412-3456-7890-123)
# - Wrong number of digits (too few, too many)
# - Letters or special characters
# - Leading/trailing whitespace
# - Dot or slash separators
#
# Returns true if the number matches one of the three valid formats, false otherwise.
# Returns false for nil input.
#
# Examples:
#   valid_card_number?("341234567890123")    #=> true
#   valid_card_number?("3712-345678-90123")  #=> true
#   valid_card_number?("3412 345678 90123")  #=> true
#   valid_card_number?("4111111111111111")   #=> false (wrong prefix)
#   valid_card_number?("3412-3456-7890-123") #=> false (wrong grouping)
#   valid_card_number?(nil)                  #=> false
def valid_card_number?(number)
  # TODO: Implement card number validation using regex
end
