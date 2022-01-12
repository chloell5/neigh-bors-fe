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
        "missions?farm_id=#{mission_data[:farm_id]}")
    end

    def driving_directions(user1, user2)
      location1 = user1.address
      location2 = user2.address

      directions = MapService.farm_directions(location1, location2)

      directions.map do |dir|
        dir[:narrative]
      end
    end

    def distance(user1, user2)

    end
  end
end
