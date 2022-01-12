class FarmFacade
  class << self
    def find_farm(current_user)
      data = FarmService.get_data("farms?user_id=#{current_user}")
      Farm.new(data)
    end

    def all_farms
      data = FarmService.get_data("farms")
      data.map do |farm|
        Farm.new(farm)
      end
    end

    def farm_create(farm_data, user_id)
      data = FarmService.post_data(
        "farms?user_id=#{user_id.to_i}&name=#{farm_data[:name]}&address=#{farm_data[:address]}&special_needs?=#{farm_data[:special_needs_details]}")[:data]
        farm = Farm.new(data)
    end

    def farm_update(farm_data, user_id)
      id = find_farm(user_id).backend_id
      data = FarmService.patch_data(
        "farms/#{id}?name=#{farm_data[:name]}&number_of_animals=#{farm_data[:number_of_animals]}&address=#{farm_data[:address]}&special_needs?=#{farm_data[:special_needs_details]}")[:data]
    end
  end
end
