class Song

    attr_reader :artist, :title, :difficulty_level

    def initialize(artist, title, difficulty_level)
        @artist = artist
        @title = title
        @difficulty_level = difficulty_level
    end

end