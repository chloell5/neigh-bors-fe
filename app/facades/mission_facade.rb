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

    def distance(rescuer, evacuee)
      location1 = rescuer.address
      location2 = evacuee.address
      distance = MapService.distance(location1, location2).round(2)
    end

    def rescuers_near_mission(mission)
      evacuee = mission.evacuee
      rescuers = UserFacade.all_users
      close_users = []
      rescuers.each do |rescuer|
        distance = MissionFacade.distance(rescuer, evacuee)
        if distance <= 30.0 && rescuer.id != evacuee.id
          close_users << rescuer
        end
      end
      close_users
    end

    def close_users_phones(mission)
      rescuers_near_mission(mission).map do |u|
        u.phone
      end
    end

    def missions_near_rescuer(current_user)
      missions = MissionFacade.all_missions
      rescuer = UserFacade.find_by_id(current_user.id.to_i)
      dis = []
      missions.each do |mission|
        evacuee = mission.evacuee
        distance = MissionFacade.distance(rescuer, evacuee)
        if distance <= 30.0 && mission.rescuer_id == nil
          dis << mission
        end
      end
      dis
    end

    def mission_create(mission_data)
      data = MissionService.post_data(
        "missions?farm_id=#{mission_data[:farm_id]}")[:data]
      mission = Mission.new(data)
    end

    def driving_directions(rescuer, evacuee)
      location1 = rescuer.address
      location2 = evacuee.address

      directions = MapService.farm_directions(location1, location2)

      directions.map do |dir|
        dir[:narrative]
      end
    end
  end
end
