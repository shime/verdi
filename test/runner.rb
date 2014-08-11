require 'minitest/autorun'
require 'verdi'

require './test/helper'

describe 'Verdi::Runner' do
  describe 'fetch' do
    it 'saves the package to disk' do
      runner = Verdi::Runner.new(['minitest'])
      File.basename(runner.fetch('4.0')).must_equal('minitest-4.0.0.gem')
    end
  end
end
