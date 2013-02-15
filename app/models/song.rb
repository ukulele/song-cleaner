class Song
  # To change this template use File | Settings | File Templates.

  attr_accessor :title
  attr_accessor :chords_used
  attr_accessor :chart

  def initialize
    @title = String.new
    @chords_user = Array.new
    @chart = Array.new
  end

end