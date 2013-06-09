require 'spec_helper'

describe Dinner do
	it { should validate_length_of(:name).within(1..100) }
	it { should have_fields(:name).of_type(String) }
	it { should validate_uniqueness_of(:name) }
end