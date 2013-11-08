require 'faraday'

class GitHub
  def self.get(route)
    conn = Faraday.new 'https://api.github.com/' do |c|
      c.use Faraday::Adapter::NetHttp
    end

    conn.headers[:user_agent] = 'RSpec API'
    conn.authorization :token, ENV['RSPEC_API_GITHUB_TOKEN']
    conn.get route
  end
end