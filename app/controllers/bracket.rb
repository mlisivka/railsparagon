#teams = ["one", "two", "three", "four", "five", "six", "seven", "eigth"]
#unused = Array.new(teams)
#hash = Hash[teams.collect { |item| [item, ""] } ]
#for i in teams
#  rndteam = unused.sample
#  unless rndteam == i
#    if hash[i] != ""
#      next
#    end
#    hash[i] = rndteam
#    hash[rndteam] = i
#    unused.delete(rndteam)
#    unused.delete(i)
#  else
#    redo
#  end
#end
#puts hash
module Bracket
  
  def generate_matches(*teams)
    matches = Array.new(teams.count-1)
    for j in 0..matches.count - 1
    	matches[j] = Match.new
    end
    generate_bracket(matches)
  end
  
  def generate_bracket(*matches)
    i = matches.count - 1
    while i >= 0
    	if Math.log2(i+2)%1 == 0
    		n = (Math.log2(i+2)*Math.log2(i+2)).to_i/2 
    	end
    	if i%2 == 0 && i != 0
    		matches[i].nextMatch = matches[i-n]
    		matches[i-1].nextMatch = matches[i-n]
    		n -= 1
    	end
      puts matches[i].inspect
    	i -= 1
    end
  end
  
end
