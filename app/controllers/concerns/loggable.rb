module Loggable
  extend ActiveSupport::Concern

  def log(msg, level: :debug)
    logger.send level, "[#{self.class}] #{msg}"
  end
end
