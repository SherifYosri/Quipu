module SeatsDecoder
	def decode_seat(binary_representation)
    row_representation = binary_representation[0..6]
    col_representation = binary_representation[7..9]

    {
      row: decode_seat_row(row_representation), 
      col: decode_seat_col(col_representation) 
    }
  end

  private

  def decode_seat_row(row_representation)
    row_range = 0..127
    row_representation.each_char{ |r|
      remaining_rows = row_range.end - row_range.begin + 1
      if r == "F"
        row_range = row_range.begin..(row_range.end - remaining_rows / 2)
      elsif r == "B"
        row_range = (row_range.begin + remaining_rows / 2)..row_range.end
      end
    }

    row_range.begin
  end

  def decode_seat_col(col_representation)
    col_range = 0..7
    col_representation.each_char{ |c|
      remaining_columns = col_range.end - col_range.begin + 1
      if c == "L"
        col_range = col_range.begin..(col_range.end - remaining_columns / 2)
      elsif c == "R"
        col_range = (col_range.begin + remaining_columns / 2)..col_range.end
      end
    }

    col_range.begin
  end
end