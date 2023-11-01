require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { build(:address) }

  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }

  it 'has a valid factory' do
    expect(build(:address)).to be_valid
  end
end
