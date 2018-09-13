require 'graphiti_spec_helpers'

::RSpec.shared_context 'resource testing', type: :resource do |parameter|
  let(:resource)     { described_class }
  let(:params)       { {} }

  around do |e|
    begin
      original = Graphiti::Resource.validate_endpoints
      Graphiti::Resource.validate_endpoints = false
      e.run
    ensure
      Graphiti::Resource.validate_endpoints = original
    end
  end

  # If you need to set context:
  #
  # Graphiti.with_context my_context, {} do
  #   render
  # end
  def render(runtime_options = {})
    json = proxy.to_jsonapi(runtime_options)
    response.body = json
    json
  end

  def proxy
    @proxy ||= begin
      args = [params]
      args << base_scope if defined?(base_scope)
      resource.all(*args)
    end
  end

  def records
    proxy.data
  end

  def response
    @response ||= OpenStruct.new
  end
end

module GraphitiSpecHelpers
  module RSpec
    def self.included(klass)
      klass.send(:include, GraphitiSpecHelpers)

      ::RSpec.configure do |rspec|
        rspec.include_context "resource testing", type: :resource
      end
    end

    def self.schema!(resources = nil)
      ::RSpec.describe 'Graphiti Schema' do
        it 'generates a backwards-compatible schema' do
          message = <<-MSG
Found backwards-incompatibilities in schema! Run with FORCE_SCHEMA=true to ignore.

Incompatibilities:

          MSG

          errors = Graphiti::Schema.generate!(resources)
          errors.each do |e|
            message << "#{e}\n"
          end

          expect(errors.empty?).to eq(true), message
        end
      end
    end
  end
end
