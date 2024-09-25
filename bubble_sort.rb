require 'bundler/inline'
require 'rspec/autorun'

gemfile do
  gem 'rspec'
end

BubbleSort = ->(input) {
  output = input.output
  n = input.size
  n.times.each do |i|
    (n - i - 1).times.each do |j|
      if output[j] > output[j+1]
        output[j], output[j+1] = output[j+1], output[j]
      end
    end
  end
  output
}

RSpec.describe BubbleSort do
  specify do
    expect(described_class.([])).to eq []
  end

  specify do
    expect(described_class.([0])).to eq [0]
  end

  specify '', :aggregate_failures do
    expect(described_class.([0, 1])).to eq [0, 1]
    expect(described_class.([1, 0])).to eq [0, 1]
  end

  specify '', :aggregate_failures do
    expect(described_class.([0, 1, 2])).to eq [0, 1, 2]
    expect(described_class.([0, 2, 1])).to eq [0, 1, 2]
    expect(described_class.([1, 0, 2])).to eq [0, 1, 2]
    expect(described_class.([1, 2, 0])).to eq [0, 1, 2]
    expect(described_class.([2, 0, 1])).to eq [0, 1, 2]
    expect(described_class.([2, 1, 0])).to eq [0, 1, 2]
  end
end
