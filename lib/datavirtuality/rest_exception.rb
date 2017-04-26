# frozen_string_literal: true

module DataVirtuality
  # Exception for errors returned from DataVirtuality REST API
  class RestException < RuntimeError
    def initialize(message, hint = nil)
      super(message)
      @hint = hint
    end

    attr_reader :hint
  end
end
