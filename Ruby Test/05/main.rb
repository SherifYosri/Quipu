class Main
  require_relative '../input_file_reader'
  require_relative 'seats_decoder'

  include InputFileReader
  include SeatsDecoder
  
  def initialize
    @seats = read_input("input.txt")
  end

  def solve
    highest_seat_id = -1

    @seats.each{ |seat|
      decoded_seat = decode_seat(seat)
      seat_id = decoded_seat[:row] * 8 + decoded_seat[:col]
      highest_seat_id = seat_id if seat_id > highest_seat_id
    }

    highest_seat_id
  end    
end
