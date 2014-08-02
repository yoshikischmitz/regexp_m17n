# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  def test_non_empty_string
    # No point testing against dummy encodings. 
    #   see: http://www.ruby-doc.org/core-2.1.2/Encoding.html#method-i-dummy-3F
    Encoding.list.reject(&:dummy?).each do |enc|
      assert(RegexpM17N.non_empty?('.'.encode(enc)))
    end
  end
end
