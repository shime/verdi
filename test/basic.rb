require 'minitest/autorun'
require 'verdi'

require './test/helper'

describe 'CLI' do
  describe 'when no arguments are provided' do
    it 'outputs usage' do
      `./bin/verdi`.must_equal Verdi.usage
    end
  end

  describe 'when --help is the only argument' do
    it 'outputs usage' do
      `./bin/verdi --help`.must_equal Verdi.usage
    end
  end

  describe 'when -h is the only argument' do
    it 'outputs usage' do
      `./bin/verdi -h`.must_equal Verdi.usage
    end
  end
end
