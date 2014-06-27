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
end
