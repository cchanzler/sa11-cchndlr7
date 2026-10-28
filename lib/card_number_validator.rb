
def valid_card_number?(number)
  return false if number.nil?

  regex = /\A(?:3[47]\d{13}|3[47]\d{2}-\d{6}-\d{5}|3[47]\d{2} \d{6} \d{5})\z/

  !!(number =~ regex)
end
