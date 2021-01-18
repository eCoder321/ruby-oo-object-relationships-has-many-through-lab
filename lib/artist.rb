require 'pry'
class Artist
    @@all = []

    attr_reader :name

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def new_song(name, genre)
        Song.new(name, self, genre)
    end

    def songs
        Song.all.select {
            |song_instance|
            song_instance.artist == self
        }
    end

    def genres
        # binding.pry
        self.songs.collect {
            |song_instance|
            #binding.pry
            song_instance.genre
        }
    end

    def self.all
        @@all
    end
end
