class MissionFacade
  class << self
    def mission_search(mission_id)
      data = UserService.get_data("missions/#{mission_id}")[:data]

      mission = Mission.new(data)
    end

    def all_missions
      data = UserService.get_data("missions")

      data.map do |mission|
        Mission.new(mission)
      end
    end

    def mission_create(mission_data)
      data = MissionService.post_data(
        "missions?user_id=#{session[:user_id]}")
      farm = Farm.new(data)
      require "pry"; binding.pry
    end
  end
end
