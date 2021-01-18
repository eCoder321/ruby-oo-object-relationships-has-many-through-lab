class Genre
    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def songs
        Song.all.select {
            |song_instance|
            song_instance.genre == self
        }
    end

    def artists
        self.songs.collect {
            |song_instance|
            song_instance.artist
        }
    end

    def self.all
        @@all
    end
end
