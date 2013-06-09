require 'spec_helper'

describe DinnersController do
	context '#update' do
    it 'renders edit if save successful' do
      subject.dinner.stub(:save).and_return(true)
      subject.should_receive(:redirect_to).with(dinners_path)
    end

    it 'redirects to dinners_path if save failed' do
      subject.dinner.stub(:save).and_return(false)
      subject.should_receive(:render).with(:edit)
    end

    after(:each) do
      subject.update
    end
  end
end