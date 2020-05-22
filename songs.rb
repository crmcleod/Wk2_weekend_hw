class Song

    attr_reader :artist, :song, :difficulty_level

    def initialize(artist, song, difficulty_level)
        @artist = artist
        @song = song
        @difficulty_level = difficulty_level
    end

end