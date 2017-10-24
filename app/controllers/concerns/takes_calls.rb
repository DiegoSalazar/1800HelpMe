module TakesCalls
  extend ActiveSupport::Concern

  def take_call
    CreateCallService.new.call params
  end
end
