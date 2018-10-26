require 'spec_helper'

describe 'In code converted from pseudocode' do
  describe 'the \"average_numbers\" method' do
    it 'exists' do
      expect { average_numbers([]) }.not_to raise_error
    end

    it 'handles empty collection properly' do
      expect { average_numbers([]) }.not_to raise_error
    end

    it 'correctly averages a simple data set' do
      expect(average_numbers([1,2,3])).to eq(2)
    end

    it 'correctly averages a simple data set' do
      expect(average_numbers([1,7,3])).to be_within(0.1).of(3.6)
    end
  end
end
