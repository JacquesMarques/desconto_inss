require 'rails_helper'

RSpec.describe Proponent, type: :model do
  let(:proponent) { build(:proponent) }

  it 'has a valid factory' do
    expect(build(:proponent)).to be_valid
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:document) }
  it { should validate_presence_of(:birthday) }
  it { should validate_presence_of(:salary) }
  it { should validate_presence_of(:inss_discount) }

  it { should belong_to(:address) }
end
