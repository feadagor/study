module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        rez = array.map {|element| element > 0? max:element}
        rez
      end

      def search(_array, _query)
        half_length = _array.length / 2
        if _array[half_length] == _query
          index = half_length
        elsif half_length == 0
          index = -1
        elsif  _array[half_length] > _query
          index = search(_array[0..(half_length - 1)], _query)
        else
          index_in_sub_array = search(_array[half_length.. - 1], _query)
          index = index_in_sub_array >= 0 ? half_length + index_in_sub_array : -1 
        end
        index
      end
    end
  end
end
