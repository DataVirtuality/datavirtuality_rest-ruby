# frozen_string_literal: true

require 'httpclient'
require 'json'
require 'json/ext'

module DataVirtuality
  # DataVirtuality REST client
  class Rest
    def initialize(host, username, password)
      @host = host
      @username = username
      @password = password

      @http_client = HTTPClient.new
      @http_client.set_auth(host, username, password)
    end

    def status
      json_response(http_get('status'))&.[](:status)&.downcase&.to_sym
    end

    def data_sources
      json_response(http_get('source')).map { |h| h[:Name] }
    end

    def get(table)
      json_response(http_get('source/' + table))
    end

    def query(sql)
      json_response(http_post('query?array=false', sql: sql))
    end

    private

    attr_reader :http_client, :host, :username, :password

    def http_get(path)
      response = http_client.get endpoint(path)

      { status: response.status, body: response.body }
    end

    def http_post(path, body)
      response = http_client.post(
        endpoint(path),
        body.to_json,
        'Content-Type' => 'application/json'
      )

      { status: response.status, body: response.body }
    end

    def endpoint(path)
      host + '/rest/api/' + path
    end

    def json_response(result)
      if result[:status] != 200
        error = begin
          JSON.parse result[:body]
        rescue => e
          raise RestException, e.message
        end

        raise RestException, error['description'], error['hint']
      end

      JSON.parse result[:body], symbolize_names: true
    end
  end
end
