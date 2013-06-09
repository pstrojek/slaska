require 'spec_helper'


describe User do 
  
  describe 'document' do

    it { should be_timestamped_document }
    it { should validate_length_of(:name).within(1..100) }
    it { should have_fields(:name, :uid, :provider).of_type(String) }
    it { should have_fields(:admin).of_type(Boolean) }
  end

  let(:auth_hash) {
    {
      'provider' => 'rspec',
      'uid' => '12345678',
      'info' => {
        'name' => 'John Smith'
      }
    }
  }  

  it 'creates new user from valid auth hash' do
    user = User.find_or_create_from_auth_hash(auth_hash)
    user.should be_persisted
  end

  describe 'when user exists in database' do
    let!(:user) { create(:user) }
    it 'returns existing users when finding a match' do
      old_user = User.find_or_create_from_auth_hash(auth_hash)
      old_user.should == user
    end
  end
end

