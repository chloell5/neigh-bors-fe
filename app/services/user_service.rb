class UserService
  class << self
    def conn
      conn = Faraday.new(url: 'http://localhost:3000/api/v1')
    end

    def get_data(url)
      response = conn.get(url)

      JSON.parse(response.body, symbolize_names: true)
    end

    def post_data(url)
      response = conn.post(url)

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
