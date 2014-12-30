require 'spec_helper'

describe BartWaitingList do
  subject { BartWaitingList.new 'test@example.com', 'password' }

  describe '#new' do
    it 'should return a BartWaitingList object' do
      expect(subject).to be_an_instance_of BartWaitingList
    end

    it 'should contain the source for the waiting list page' do
      expect(subject.page).to be_an_instance_of String
    end
  end

  describe '#get_waiting_list_position' do
    it 'should return Fixnum if successful' do
      expect(subject.get_waiting_list_position(:fruitvale)).to be_an_instance_of Fixnum
    end

    it 'should parse the result and get the correct position' do
      expect(subject.get_waiting_list_position(:fruitvale)).to eq 113
    end

    it 'should return nil if invalid' do
      expect(subject.get_waiting_list_position(:montgomery)).to be_nil
    end
  end
end

