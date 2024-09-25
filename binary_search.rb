require 'bundler/inline'
require 'rspec/autorun'

gemfile do
  gem 'rspec'
end

module BinarySearch
  def self.call(input, target, low=nil, high=nil)
    low ||= 0
    high ||= input.size - 1

    return nil if low > high

    mid = (low + high) / 2

    case input[mid] <=> target
    when 0  then mid
    when 1  then call(input, target, low, mid - 1)
    when -1 then call(input, target, mid + 1, high)
    end
  end
end

RSpec.describe BinarySearch do
  specify do
    expect(described_class.([], 1)).to eq nil
  end

  specify do
    expect(described_class.([0], 1)).to eq nil
  end

  specify do
    expect(described_class.([1], 1)).to eq 0
  end

  specify do
    expect(described_class.([1, 3, 4, 5, 7, 9, 11], 3)).to eq 1
  end
end
