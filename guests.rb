class Guest

    attr_reader :name, :favourite_song, :skill_level, :wallet

    def initialize(name, favourite_song, skill_level, wallet)
    @name = name
    @favourite_song = favourite_song
    @skill_level = skill_level
    @wallet = wallet
    end

    # def find_song(title, artist)
end