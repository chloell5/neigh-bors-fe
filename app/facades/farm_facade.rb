class FarmFacade
  class << self
    def farm_search(farm_name)
      data = FarmService.get_data("farms?name=#{farm_name}")[:data]

      farm = Farm.new(data)
    end

    def all_farms
      data = FarmService.get_data("farms")

      data.map do |farm|
        Farm.new(farm)
      end
    end

    def farm_create(farm_data)
      data = FarmService.post_data(
        "farms?name=#{farm_data[:name]}&address=#{farm_data[:address]}&address=#{farm_data[:address]}&special_needs?=#{farm_data[:special_needs_details]}&user_id=#{session[:user_id]}")[:data]
      farm = Farm.new(data)
    end
  end
end
