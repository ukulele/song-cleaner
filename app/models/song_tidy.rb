# The algorithm should find the chord, find the word it's underneath
# and if it's nearer the end of the word than the beginning, add the chord to the end, and vice versa


class SongTidy
  attr_accessor :input, :song
  # To change this template use File | Settings | File Templates.
  TABS_TO_SPACES = '    '

  def initialize
    @song = Song.new()
    @input = Array.new()

    #read_raw_song()
  end

  def read_raw_song
    file = File.open('songs/raw/dedicated_follower_of_fashion.txt', 'r')

    file.each { |line|
      unless line.strip.empty?
        line.gsub!(/\t/, TABS_TO_SPACES)
        input.push(line) # push an array of the line characters with spaces and all
      end
    }
    file.close()

    # first line should be title
    song.title = input.shift()

    input
    #extract_pairs()
  end

  def extract_pairs
    output = Array.new
    pairs = input.clone
    until pairs.length == 0
      output.push([pairs.shift, pairs.shift])
    end
    puts("Pairs: " + output.to_s)

    #process_pairs(output)
    output
  end

  def process_pairs(pairs)
    processed = Array.new

    pairs.each { |pair|
      chords = pair[0]
      chords.delete('\n')

      process = pair[1]
      chord_list = chords.clone.split(/\b(\w+)\b/).reject! { |c| c.strip.empty? }

      puts ("Chord String: " + chords.to_s)
      puts ("Split Chords: " + chord_list.to_s)

      c_pos = chord_positions(chords)
      c_pos.each { |pos|
        s_pos = space_positions(process) # we need to check the positions of the spaces after every insertion :)

        insert_pos = get_nearest(s_pos, pos)
        puts("Inserting chord at " + insert_pos.to_s)

        chord = chord_list.shift()
        process.insert(insert_pos, "[" + chord + "]")
        puts("inserting " + chord.to_s + " at " + insert_pos.to_s)
      }
      processed << process
      puts("----------------------------------------")
    }
    processed
  end

  def chord_positions(line)
    positions = line.enum_for(:scan, /\b(\w+)\b/).map { Regexp.last_match.begin(0) }
    puts "Chord Positions " + positions.to_s
    positions
  end

  def space_positions(line)
    positions = line.enum_for(:scan, /[\s]/).map { Regexp.last_match.begin(0) }
    puts "Line Positions " + positions.to_s
    positions
  end

  def get_nearest(list, n)
    list.sort{|a,b|(a-n).abs<=>(b-n).abs}[0]
  end


end