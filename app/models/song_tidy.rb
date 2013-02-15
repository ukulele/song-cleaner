class SongTidy
  attr_accessor :input
  # To change this template use File | Settings | File Templates.

  def initialize
    @song = Song.new
  end

  def read_raw_song
    @input = Array.new
    file = File.open("songs/raw/dedicated_follower_of_fashion.txt", "r")

    file.each { |line|
      unless line.empty?
        input.push(line.scan(/./)) # push an array of the line characters with spaces and all
      end
    }
    # first line should be title
    @song.title = input.shift().join()
  end

  def inspectChordsLine

  end

  def inspectLyricLine

  end

end