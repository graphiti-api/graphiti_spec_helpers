require 'rspec/core'
require 'graphiti_spec_helpers'

::RSpec.shared_context 'resource testing', type: :resource do |parameter|
  let(:resource)     { described_class }
  let(:params)       { {} }

  around do |e|
    begin
      original = Graphiti::Resource.validate_endpoints
      Graphiti::Resource.validate_endpoints = false

      Graphiti.with_context graphiti_context do
        e.run
      end
    ensure
      Graphiti::Resource.validate_endpoints = original
    end
  end

  def graphiti_context
    @graphiti_context ||= begin
      ctx = OpenStruct.new
      ctx.current_user = current_user if respond_to?(:current_user)
      ctx.params = params
      ctx
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

RSpec.shared_context 'remote api' do
  # Fake request headers
  around do |e|
    ctx = OpenStruct.new \
      request: OpenStruct.new(headers: OpenStruct.new)
    Graphiti.with_context(ctx) { e.run }
  end

  def mock_api(url, json, call_count = 1)
    api_response = double(body: json.to_json)
    expect(Faraday).to receive(:get)
      .with(url, anything, anything)
      .exactly(call_count).times
      .and_return(api_response)
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
