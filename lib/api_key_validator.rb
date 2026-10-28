
def valid_api_key?(key)
  return false if key.nil?

  regex = /\A(?:sk|pk)-(?=[A-Za-z0-9]*[A-Z])(?=[A-Za-z0-9]*[a-z])(?=[A-Za-z0-9]*[0-9])[A-Za-z0-9]{32}\z/

  !!(key =~ regex)
end
