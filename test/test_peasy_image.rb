# frozen_string_literal: true

require "minitest/autorun"
require "peasy_image"

class TestPeasyImage < Minitest::Test
  def test_version
    refute_nil PeasyImage::VERSION
    assert_equal "0.1.1", PeasyImage::VERSION
  end
end
