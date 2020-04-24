require 'pry'
class Song
    @@all = []
    attr_accessor :name, :artist_name
    def initialize(name=false)
        if name then @name = name end
    end

    def self.create
        a = Song.new
        @@all << a
        a
    end

    def self.new_by_name(title)
        Song.new(title)
    end

    def self.create_by_name(title)
        a = Song.new(title)
        @@all << a
        a
    end

    def self.all
        @@all
    end

    def self.find_by_name(title)
        self.all.find {|song| song.name == title}
    end

    def self.find_or_create_by_name(title)
        find_by_name(title) ? find_by_name(title) : create_by_name(title)
    end

    def self.alphabetical
        self.all.sort {|s1, s2| s1.name <=> s2.name}
    end

    def self.new_from_filename(filename) #"Thundercat - For Love I Come.mp3"
        singer, title, format = filename.split(%r{\ \-\ |\.})
        x = new_by_name(title)
        x.artist_name = singer
        x
    end

    def self.create_from_filename(filename)
        singer, title, format = filename.split(%r{\ \-\ |\.})
        x = create_by_name(title)
        x.artist_name = singer
        x
    end

    def self.destroy_all
        self.all.clear
    end

end
#
#  alpha = Song.create
#  alpha.name = "Liz"
#
# puts alpha.name

#
 # beta = Song.new_by_name("Jack")
 # puts beta.name
#
# gamma = Song.create_by_name("Kenneth")
# print Song.all
# #puts alpha.name
