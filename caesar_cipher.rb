print "Please input a sentece: "
text = gets.chomp
puts "Input is #{text}"
puts

print "Please input a shift factor, either positive / negative number: "
shift_factor = gets.chomp.to_i
puts "Shift factor is #{shift_factor}"
puts

def caesar_cipher(sentence, number)

    alpha = ("a".."z").to_a
    numbers = (1..alpha.length).to_a
    alpha_map = alpha.zip(numbers).to_h

    puts alpha_map
    puts

    sentence.split("").map do |char|
        if alpha.include?(char.downcase)
            index = alpha_map[char.downcase] + number
    
            if number > 0
                index = (index > alpha.length)? index - alpha.length : index
            else
                index = (index < 0)? alpha.length + index : index
            end
    
            new_char = alpha_map.select {|word, position| position == index}.keys[0]
            new_char = (!char.upcase!)? new_char.upcase : new_char
            new_char
        else
            char
        end
    end
    
end

new_text = caesar_cipher(text, shift_factor).join("")
puts "The Cipher is: #{new_text}"