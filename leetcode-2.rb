require 'rspec/autorun'

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def ==(other)
    @val == other.val && @next == other.next
  end
end

def add_two_numbers(l1, l2)
  head = ListNode.new(0)
  tail = head
  rest = 0
  while l1 || l2 || rest
    sum = (l1&.val || 0) + (l2&.val || 0) + (rest || 0)
    rest = sum > 9 ? 1 : nil
    tail.next = ListNode.new(sum % 10)
    tail = tail.next
    l1 = l1&.next
    l2 = l2&.next
  end
  head.next
end

RSpec.describe '#add_two_numbers' do
  specify do
    l1 = ListNode.new(2, ListNode.new(4, ListNode.new(3)))
    l2 = ListNode.new(5, ListNode.new(6, ListNode.new(4)))
    l3 = ListNode.new(7, ListNode.new(0, ListNode.new(8)))

    expect(add_two_numbers(l1, l2)).to eq(l3)
  end

  specify do
    l1 = ListNode.new(0)
    l2 = ListNode.new(0)
    l3 = ListNode.new(0)

    expect(add_two_numbers(l1, l2)).to eq(l3)
  end

  specify do
    l1 = ListNode.new(9, ListNode.new(9, ListNode.new(9)))
    l2 = ListNode.new(9)
    l3 = ListNode.new(8, ListNode.new(0, ListNode.new(0, ListNode.new(1))))

    expect(add_two_numbers(l1, l2)).to eq(l3)
  end
end
