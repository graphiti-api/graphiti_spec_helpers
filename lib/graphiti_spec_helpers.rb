require 'json'
require 'pp'
require 'active_support/core_ext/string'
require 'active_support/core_ext/hash'
require 'graphiti'

require 'graphiti_spec_helpers/version'
require 'graphiti_spec_helpers/helpers'
require 'graphiti_spec_helpers/node'
require 'graphiti_spec_helpers/errors_proxy'
require 'graphiti_spec_helpers/errors'

module GraphitiSpecHelpers
  def self.included(klass)
    klass.send(:include, Helpers)
  end

  class TestRunner < ::Graphiti::Runner
    def current_user
      nil
    end
  end

  module Sugar
    def d
      jsonapi_data
    end

    def included(type = nil)
      jsonapi_included(type)
    end

    def errors
      jsonapi_errors
    end

    def dt(*args)
      json_datetime(*args)
    end

    def datetime(*args)
      json_datetime(*args)
    end

    def date(*args)
      json_date(*args)
    end
  end
end
