require 'test_helper'

class ParameterTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Parameter.new.valid?
  end
end
