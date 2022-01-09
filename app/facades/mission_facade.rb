class MissionFacade
  class << self
    def mission_search(mission_id)
      data = UserService.get_data("missions/#{mission_id}")[:data]

      mission = Mission.new(data)
    end
  end
end
