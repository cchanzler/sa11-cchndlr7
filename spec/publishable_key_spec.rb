
require_relative '../lib/api_key_validator'

RSpec.describe 'Publishable API keys' do
  it 'accepts a valid publishable key' do
    key = 'pk-Abcdefghijklmnopqrstuvwxyz123456'
    expect(valid_api_key?(key)).to be true
  end

  it 'rejects a publishable key without uppercase letters' do
    key = 'pk-abcdefghijklmnopqrstuvwxyz123456'
    expect(valid_api_key?(key)).to be false
  end

  it 'rejects a publishable key without digits' do
    key = 'pk-Abcdefghijklmnopqrstuvwxyzabcdef'
    expect(valid_api_key?(key)).to be false
  end

  it 'rejects a publishable key with the wrong prefix' do
    key = 'px-Abcdefghijklmnopqrstuvwxyz123456'
    expect(valid_api_key?(key)).to be false
  end
end
