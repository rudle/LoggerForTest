require 'delegate'

# This is the implementation of Logger that stores an in memory representation
# of your log lines. It uses the delegator pattern to ensure that things
# continue to work
# suggested usages:
# LoggerForTest.new(Logger.new(STDOUT))
# LoggerForTest.new(Rails.logger))
class LoggerForTest < SimpleDelegator
  def initialize(*args)
    super
    @log_lines = []
  end
  attr_accessor :log_lines

  def add(sev, message = nil, progname = nil)
    log_lines << format(sev, message, progname)
    super(sev, message, progname)
  end

  def format(sev, message, progname)
    { sev: sev,
      message: message,
      progname: progname }
  end
end
