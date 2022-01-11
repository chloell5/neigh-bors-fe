class FarmFacade
  class << self
    def find_farm(current_user)
      data = FarmService.get_data("farms?user_id=#{current_user}")[:data]

      data.map do |farm|
        Farm.new(farm)
      end
    end

    def all_farms
      data = FarmService.get_data("farms")[:data]
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
