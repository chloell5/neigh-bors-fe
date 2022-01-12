class FarmService
  class << self
    def conn
      conn = Faraday.new(url: ENV['backend_api_path'])
    end

    def get_data(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)[:data]
    end

    def post_data(url)
      response = conn.post(url)

      JSON.parse(response.body, symbolize_names: true)
    end

    def patch_data(url)
      response = conn.patch(url)

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
