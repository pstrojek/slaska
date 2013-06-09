require 'spec_helper'

describe Order do
  describe 'document' do 
    it { should have_fields(:status).of_type(Symbol) }
    it { should validate_inclusion_of(:status).to_allow([:waiting, :not_sent, :sent])}
    it { should validate_presence_of(:user) }
    it { should have_and_belong_to_many(:dinners).as_inverse_of(nil) }
    it { should belong_to(:user) }
  end

  it "doesnt't validate if having no dinners" do
    build(:order, dinners: []).should have(1).error_on(:dinners)
  end
end

