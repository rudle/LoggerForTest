# encoding: UTF-8
require 'delegate'

# This is the implementation of Logger that stores an in memory representation
# of your log lines. It uses the delegator pattern to ensure that things
# continue to work
# suggested usages:
# LoggerForTest.new(Logger.new(STDOUT))
# LoggerForTest.new(Rails.logger))
class LoggerForTest < SimpleDelegator
  VERSION = '0.0.1'
  def initialize(*args)
    super
    @log_lines = []
  end
  attr_accessor :log_lines

  def add(sev, message, progname = nil)
    log_lines << format(sev, message, progname)
    super(sev, message, progname)
  end

  def contains_log?(sev, message, progname = nil)
    log_lines.any? { |line| format(sev, message, progname) == line }
  end

  private

  def format(sev, message, progname = nil)
    { sev: sev,
      message: message,
      progname: progname }
  end
end
