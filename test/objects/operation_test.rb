require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class OperationTest < MiniTest::Unit::TestCase

  def test_parses_operations
    operation = OBIX.parse string: fixture("objects/operation.xml")

    assert_instance_of OBIX::Objects::Operation, operation
    assert_equal "/operate", operation.href
    assert_equal "obix:Nil", operation.in
    assert_equal "obix:Nil", operation.out

    Net::HTTP.any_instance.expects(:post).with("/operate", nil)

    operation.invoke
  end

end
