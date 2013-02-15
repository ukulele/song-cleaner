class TidyController < ApplicationController

  def index
    song = SongTidy.new()
    @t = song.read_raw_song()
    @pairs = song.extract_pairs()
    @processed = song.process_pairs(@pairs)
  end

end
