# frozen_string_literal: true

class ApplicationService
  def initialize(params)
    @params = params
  end

  def self.call(*args, &block)
    new(*args, &block).call
  end
end
