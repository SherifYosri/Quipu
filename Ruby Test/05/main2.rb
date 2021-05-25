class Main2
  require_relative '../input_file_reader'
  require_relative 'seats_decoder'

  include InputFileReader
  include SeatsDecoder
  
  def initialize
    @seats = read_input("input.txt")
  end

  def solve
    highest_seat_id = -1
    lowest_seat_id = 1e+18.to_i
    seats_ids_sum = 0

    @seats.each{ |seat|
      decoded_seat = decode_seat(seat)
      seat_id = decoded_seat[:row] * 8 + decoded_seat[:col]

      lowest_seat_id = seat_id if seat_id < lowest_seat_id
      highest_seat_id = seat_id if seat_id > highest_seat_id
      seats_ids_sum += seat_id
    }

    lowest_seat_id -= 1
    cumulative_sum_of_highest_seat_id = (highest_seat_id * (highest_seat_id + 1)) / 2
    cumulative_sum_of_lowest_seat_id = (lowest_seat_id * (lowest_seat_id + 1)) / 2
    cumulative_sum_of_seats_actual_range = cumulative_sum_of_highest_seat_id - cumulative_sum_of_lowest_seat_id

    missing_seat_id = cumulative_sum_of_seats_actual_range - seats_ids_sum
  end    
end
