require "obix"
require "minitest/unit"
require "minitest/autorun"

require "test_helper"

class OperationTest < MiniTest::Unit::TestCase
  def test_parses_operations
    operation = OBIX.parse string: fixture("objects/operation.xml")

    assert_instance_of OBIX::Objects::Operation, operation
    assert_equal "http://domain/operate", operation.href
    assert_equal "obix:Nil", operation.in
    assert_equal "obix:Nil", operation.out
  end

  def test_invokes_operations
    operation = OBIX.parse string: fixture("objects/operation.xml")

    OBIX::Network.
      expects(
        :post
      ).
      with(
        'http://domain/operate'
      ).
      returns(
        fixture "objects/string.xml"
      )

    result = operation.invoke

    assert_instance_of OBIX::Objects::String, result
  end
end
