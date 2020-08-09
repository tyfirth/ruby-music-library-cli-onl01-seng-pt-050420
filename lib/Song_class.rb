require 'pry'

class Song

    attr_accessor :name, :song, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist
        self.genre= genre if genre
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
        self.new(name).tap do |song|
            song.save
        end
    end

    def artist 
        @artist 
    end

    def artist=(artist)
        if @artist == nil 
            @artist = artist
        else
            @artist = @artist
        end
        if self.artist != nil
            @artist.add_song(self)
        end
        @artist
    end

    def genre
        @genre
    end

    def genre= (genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.find_by_name(name)
        @@all.find do |song|
            song.name == name
        end
    end

    def self.find_or_create_by_name(name)
        find_by_name(name) || self.create(name) unless @@all.include?(name)
    end

    def self.new_from_filename(name)
        song_name = name.split(" - ")[1]
        artist_name = name.split(" - ")[0]
        genre_name = name.split(" - ")[2].chomp(".mp3")
        song = self.find_or_create_by_name(song_name)
        song.artist = Artist.find_or_create_by_name(artist_name)
        song.genre = Genre.find_or_create_by_name(genre_name)
        song
    end

    def self.create_from_filename(name)
        @@all << self.new_from_filename(name)
    end



end