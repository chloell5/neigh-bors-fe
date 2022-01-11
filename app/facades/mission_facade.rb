class MissionFacade
  class << self
    def mission_search(mission_id)
      data = MissionService.get_data("missions/#{mission_id}")

      mission = Mission.new(data)
    end

    def all_missions
      data = MissionService.get_data("missions")

      data.map do |mission|
        Mission.new(mission)
      end
    end

    def mission_create(mission_data)
      data = MissionService.post_data(
        "missions?user_id=2")
      farm = Farm.new(data)
    end
  end
end
