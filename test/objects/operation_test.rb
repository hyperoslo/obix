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
  end

  def test_invokes_operations
    operation = OBIX.parse string: fixture("objects/operation.xml")

    # This is either ugly as fuck, or absolutely beautiful. I'm not sure which yet.
    Net::HTTP.any_instance.
      expects(
        :post
      ).
      with(
        "/operate", nil
      ).
      returns(
        stub body: fixture("objects/string.xml")
      )

    result = operation.invoke

    assert_instance_of OBIX::Objects::String, result
  end
end
