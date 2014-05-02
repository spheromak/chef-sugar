require 'spec_helper'
require 'chef/sugar/core_extensions'

describe Object do

  describe '#blank?' do
    it 'includes the method' do
      expect(described_class).to be_method_defined(:blank?)
    end

    [nil, false, '', "", [], {}].each do |v|
      it "#{v.inspect} should be blank" do
        expect(v.blank?).to eq(true)
      end
    end

    [
      '   ', "\u00a0", "  \n\t  \r ", Object.new,
      true, 0, 1, 'a', [nil], { nil => 0 }
    ].each do |v|
      it "#{v.inspect} should not be blank" do
        expect(v.blank?).to eq(false)
      end
    end
  end
end
