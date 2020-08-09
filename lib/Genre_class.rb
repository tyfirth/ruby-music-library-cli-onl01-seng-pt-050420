class Genre

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
    self.new(name).tap do |genre|
        genre.save
    end
end

def songs
    @songs
end

def artists
    artists = @songs.collect do |song|
        song.artist
    end
    artists.uniq
end

end
