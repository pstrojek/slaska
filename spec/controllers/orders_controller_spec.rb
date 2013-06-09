require 'spec_helper'

describe OrdersController do
  context '#create' do
    it 'redirects to orders_path if save successful' do
      subject.stub(:params).and_return(:form_action => 'Finish')
      subject.order.stub(:save).and_return(true)
      subject.should_receive(:redirect_to).with(orders_path)
    end

    it 'results in error if adding empty dinner' do
      subject.stub(:params).and_return(:form_action => 'Finish')
      subject.order.stub(:save).and_return(false)
      subject.should_receive(:render).with(:new)
    end

    it 'adding a dinner continues the order' do
      subject.stub(:params).and_return(:form_action => 'Add')
      subject.should_receive(:render).with(:new)
    end

    before(:each) do
      subject.stub(:current_user).and_return(nil)
    end

    after(:each) do
      subject.create
    end
  end

  context '#update' do
    it 'renders edit if save successful' do
      subject.order.stub(:save).and_return(true)
      subject.should_receive(:redirect_to).with(orders_path)
    end


    it 'redirects to orders_path if save failed' do
      subject.order.stub(:save).and_return(false)
      subject.should_receive(:render).with(:edit)
    end

    after(:each) do 
      subject.update
    end
  end
end
