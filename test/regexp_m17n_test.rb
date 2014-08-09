# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  # Ruby does not implement converters for these:
  IGNORE_LIST = ['ISO-2022-JP-2', 'UTF-7']

  TEST_ENC_LIST = Encoding.list.reject{|x| IGNORE_LIST.include? x.name}

  def test_non_empty_string
    TEST_ENC_LIST.each do |enc|
      assert(RegexpM17N.non_empty?('.'.encode(enc)))
    end
  end
end
