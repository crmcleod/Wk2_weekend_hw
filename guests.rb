class Guest

    attr_reader :name, :favourite_song, :skill_level

    def initialize(name, favourite_song, skill_level)
    @name = name
    @favourite_song = favourite_song
    @skill_level = skill_level
end

    # def add_song(song)
    #     @room1.song_queue << song
    # end
end