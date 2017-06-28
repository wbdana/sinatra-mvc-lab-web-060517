class PigLatinizer

  @@vowels = ["a", "e", "i", "o", "u"]

  # This method splits multi-word strings and sends each word to #piglatnize, or, if single-word string, simply sends it to #piglatinize
  def to_pig_latin(params)
    # binding.pry
    if params.include?(" ")
      params.split(" ").map do |word|
        piglatinize(word)
      end.join(" ")
    else
      piglatinize(params)
    end
  end

  # This method piglatinizes an individual word
  def piglatinize(params)
    # Check if user phrase has any vowels; if not, don't change
    if params.split("").any?{|l| @@vowels.include?(l.downcase)}
      # Check if user phrase starts with a vowel
      if @@vowels.include?(params[0].downcase)
        params = params + "way"
      else
        # Find the string-index number of the first vowel in the string
        first_vowel_index = params.split("").index do |letter|
          @@vowels.include?(letter)
        end
        # Cut off the leading consonants
        leading_consonants = params.slice!(0, first_vowel_index)
        # Add leading consonants and "ay" to back
        params = params + leading_consonants + "ay"
      end
    else
      # If no vowels in word
      params
    end
  end

end
