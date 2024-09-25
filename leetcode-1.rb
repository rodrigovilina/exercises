require 'rspec/autorun'

def two_sum(nums, target)
  indices = {}
  nums.each_with_index do |el, i|
    rest = target - el
    index = indices[rest]
    return index, i if index
    indices[el] = i
  end
end

RSpec.describe '#two_sum' do
  specify do
    nums = [2, 7, 11, 15]
    target = 9
    expect(two_sum(nums, target)).to eq [0, 1]
  end

  specify do
    nums = [3, 2, 4]
    target = 6
    expect(two_sum(nums, target)).to eq [1, 2]
  end

  specify do
    nums = [3, 3]
    target = 6
    expect(two_sum(nums, target)).to eq [0, 1]
  end
end
