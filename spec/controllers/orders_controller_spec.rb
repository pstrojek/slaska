require 'spec_helper'

describe OrdersController do
  context '#update' do

    it 'reders edit if save successful' do      
      subject.order.stub(:save).and_return(true)
      subject.should_receive(:redirect_to).with(orders_path)
    end

    it 'redirects to oreders_path if save failed' do
      subject.order.stub(:save).and_return(false)
      subject.should_receive(:render).with(:edit)
    end

    after(:each) do 
      subject.update
    end
  end
end