module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        array = _array.map do|film| 
          film["rating_kinopoisk"] ||= 0
          film["rating_kinopoisk"] = film["rating_kinopoisk"].to_f
          film["country"] ||= "Страна фей и единорогов"
          film
        end
        count = array.reduce(0) { |sum, film| sum += (film["rating_kinopoisk"] > 0) && (film["country"].include?',') ? 1:0}
        rating = array.reduce(0.0) { |sum, film| sum += (film["rating_kinopoisk"] > 0) && (film["country"].include?',')? film["rating_kinopoisk"]:0}
        rating / count
      end

      def chars_count(_films, _threshold)
        array = _films.map do|film| 
          film["rating_kinopoisk"] ||= 0
          film["rating_kinopoisk"] = film["rating_kinopoisk"].to_f
          film["name"] ||= ""
          film
        end
        count = array.reduce(0) { |sum, film| sum += (film["rating_kinopoisk"] >= _threshold) ? (film["name"].count "и"):0}
      end
    end
  end
end
