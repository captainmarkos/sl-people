module PeopleHelper
  def email_frequencies(people)
    chars = Hash.new(0)

    people.each do |p|
      str = p['email_address']
      chars = str.each_char.each_with_object(chars) do |char, result|
        result[char] += 1
      end
    end

    chars.sort_by { |_k, v| v }.reverse
  end
end
