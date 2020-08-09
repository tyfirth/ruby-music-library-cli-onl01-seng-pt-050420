class Artist

    extend Concerns::Findable

    attr_accessor :name, :song, :genre

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name, artist = nil, genre = nil)
        self.new(name).tap do |artist|
            artist.save
        end
    end

    def songs
        @songs
    end

    def add_song(song)
        song.artist = self unless song.artist == self
        @songs << song unless songs.include?(song)
    end

    def genres
        genres = @songs.collect do |song|
            song.genre
        end
        genres.uniq
    end


end
