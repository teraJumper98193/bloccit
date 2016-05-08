require 'rails_helper'

RSpec.describe New, type: :model do

  let(:user) { User.create!(name: "Bloccit User") }
# Shoulda tests for name
it { is_expected.to validate_presence_of(:name) }
it { is_expected.to validate_length_of(:name).is_at_least(1) }
it { is_expected.to validate_capitalization_of(:name) }
it { is_expected.to validate_spacing_of(:name) }

describe "attributes" do
  it "should have name" do
    expect(user).to have_attributes(name: "Bloccit User")
  end
end

describe "invalid user" do
  let(:user_with_invalid_name) { User.new(name: "") }


  it "should be an invalid user due to blank name" do
    expect(user_with_invalid_name).to_not be_valid
  end
 end
end
