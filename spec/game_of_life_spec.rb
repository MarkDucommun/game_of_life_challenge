require_relative '../game_of_life'

# These initial tests should fail
describe World do
  it "true equals true" do
    expect(true).to be false
  end

  it "true does not equal false" do
    expect(true).to_not be true
  end
end
