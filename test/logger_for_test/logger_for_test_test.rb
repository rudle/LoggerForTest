# encoding: UTF-8

require_relative '../test_helper'
require_relative '../../lib/logger_for_test'

describe LoggerForTest do
  before do
    @logger_double = MiniTest::Mock.new
    @logger = LoggerForTest.new(@logger_double)
  end

  describe '#add' do
    it 'shall call the implementation of Logger' do
      @logger_double.expect(:add, nil,
                            ['error', 'something went wrong', 'progname'])

      @logger.add('error', 'something went wrong', 'progname')
    end

    it 'shall log the input in memory' do
      @logger_double.expect(:add, nil,
                            ['error', 'something went wrong', 'progname'])

      @logger.add('error', 'something went wrong', 'progname')

      @logger.log_lines.must_equal [{ sev: 'error',
                                      message: 'something went wrong',
                                      progname: 'progname' }]
    end
  end

  describe '#has_log?' do
    it 'shall be true if the specified log line is in the logger' do
      @logger = LoggerForTest.new(NullLogger.new)
      @logger.add('error', 'something went wrong')

      @logger.has_log?('error', 'something went wrong').must_equal true
    end
  end
end

# A NullObject instead of a picky mock
class NullLogger
  def add(*)
    nil
  end
end
