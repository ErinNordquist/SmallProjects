#this is a game where a code is randomly generated, the user guesses at it,
#recieving feedback, and is scored based on how well they do

class Code

  @@symbols = ["0","1","2","3","4","5","6","7","8","9","A",
  "B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U",
  "V","W","X","Y","Z"]

  def initialize()
    #@len = rand(5..10)
    @code = Array.new(5)
    @code.map!{|e| @@symbols[rand(0..35)]}
  end


  def feedback(input)
    nums = /[0-9]/; lex = /[A-Z]/
    i = 0
    while (i < 5)
      v = ((@code[i]<=>input[i]) < 0)? "<" : ">"
      if(@code[i] == input[i]) then print input[i]
      elsif(input[i]=~ nums) then (if @code[i]=~ nums then print v else print "!" end)
      elsif (input[i] =~ lex) then (if @code[i]=~ lex then print v else print "!"end)
      end
      i+=1
    end
  end

#guess should be an array of chars*)
  def compare_to_code(guess)
    print "\n"
    if guess == @code then puts "Success!";return true
    elsif guess == ["g","i","v","e","u","p"] then print "You're code was "; spoil()

    else feedback(guess); return false
    end
  end

  def next_guess()
    print "\nGuess: "
    guess = STDIN.gets

    guess_arr = guess.split(//)
    guess_arr.pop()
    #print guess_arr
    if !(compare_to_code(guess_arr)) then next_guess() else exit end
  end

  def spoil()
    print @code.to_s()
  end
end

puts "Welcome to Guess The Code. Your 5 digit code of numbers and uppercase letters"
puts "has been generated.Each guess will result in 5 symbols. ! means completley wrong."
puts "(Considering A to be less than Z) > means your guess was too low,"
puts "< means your guess was too high. The symbol itself means it was correct."
puts "Type \"giveup\" to stop guessing and see the code."
code = Code.new()
#code.spoil()
code.next_guess()
