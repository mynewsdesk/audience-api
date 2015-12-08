require "faraday_middleware/response_middleware"

module Audience::Api::FaradayMiddleware
  # Public: Parse response headers for pagination.
  class PaginationParser < Faraday::Response::Middleware
    def on_complete(env)
      # do nothing if body is not a collection
      return unless env[:body].is_a? Array

      @env = env

      pagination = {
          total_count: header("Total").to_i,
          per_page: header("Per-Page"),
      }
      env[:body] = {results: env[:body], pagination: pagination.merge(process_links)}
    end

    private

    def process_links
      links = (header("Link") || "" ).split(', ').map do |link|
        href, name = link.match(/<(.*?)>; rel="(\w+)"/).captures
        [name.to_sym, href]
      end

      Hash[*links.flatten]
    end

    def header(name)
      @env[:response_headers][name]
    end
  end
end
