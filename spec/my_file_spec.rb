require 'spec_helper'

RSpec.describe MyFile do
  describe 'when file exists' do
    before do
      @file_path = './data/file.jpg'
    end

    it 'should be initialized with file path' do
      expect(described_class.new(@file_path)).to be
    end

    it 'should have contents' do
      my_file = described_class.new(@file_path)
      expect(my_file.read_file).to be_a(String)
      expect(my_file.read_file).not_to be_nil
    end

    it 'should be a string in binary format' do
      my_file = described_class.new(@file_path)
      output = /11111111110110001111111111100000000000000001000001001010010001100100100101000110000000000000000100000/
      expect(my_file.binary_string).to be_a(String)
      expect(my_file.binary_string[0..100]).to match(output)
    end

    it 'should count 0s in a string' do
      my_file = described_class.new(@file_path)
      output = '11111111110110001111111111100000000000000001000001001010010001100100100101000110000000000000000100000'.split(//)
      allow_any_instance_of(MyFile).to receive(:binary_string).and_return(output)
      expect(my_file.count_zeroes).to eq(64)
    end

    it 'should count 1s in a string' do
      my_file = described_class.new(@file_path)
      output = '11111111110110001111111111100000000000000001000001001010010001100100100101000110000000000000000100000'.split(//)
      allow_any_instance_of(MyFile).to receive(:binary_string).and_return(output)
      expect(my_file.count_ones).to eq(37)
    end
  end
end
