# encoding: UTF-8
require 'delegate'

# This is the implementation of Logger that stores an in memory representation
# of your log lines. It uses the delegator pattern to ensure that things
# continue to work
# suggested usages:
# LoggerForTest.new(Logger.new(STDOUT))
# LoggerForTest.new(Rails.logger))
class LoggerForTest < SimpleDelegator
  VERSION = '0.0.2'
  def initialize(*args)
    super
    @log_lines = []
  end
  attr_accessor :log_lines

  def add(sev, message, progname = nil)
    log_lines << format(message, sev, progname)
    super(sev, message, progname)
  end

  def contains_log?(message, sev = nil, progname = nil)
    filtered_by(sev, progname).any? do |line|
      line.fetch(:message) =~ Regexp.new(message)
    end
  end

  private

  def filtered_by(sev = nil, progname = nil)
    log_lines.select do |line|
      line[:sev] == sev || sev.nil?
      line[:progname] == progname || progname.nil?
    end
  end

  def format(message, sev = nil, progname = nil)
    { sev: sev,
      message: message,
      progname: progname }
  end
end
