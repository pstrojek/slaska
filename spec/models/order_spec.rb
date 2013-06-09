require 'spec_helper'

describe Order do
  it 'doesn\'t validate if having no dinners' do
    build(:order, dinners: []).should have(1).error_on(:dinners)
  end
end

