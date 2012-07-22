require 'active_support/tagged_logging'

module Application::TaggedLogger
  def logger
    @_tagged_logger ||= ActiveSupport::TaggedLogging.new(super)
  end
end

Application.extend(Application::TaggedLogger)
