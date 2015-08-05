ESPERANTO_ALPHABET = "abcĉdefgĝhĥijĵklmnoprsŝtuŭvz"

# How does sort/sort_by using ESPERANTO_ALPHABET work?
# ----------------------------------------------------
# start with an array
# arr = ["mi amas vin", "bonan matenon", "pacon", "ĉu vi parolas esperanton"]
# sort by takes the array of words and iterates over the first word
# now we have "mi amas vin"
# on each iteration we split the word into an array of it's letters
# ["m", "i", " ", "a", "m", "a", "s", " ", "v", "i", "n"]
# NOTE this only temporary. map is going to replace each letter with an index
# on the first iteration 'w'(see below) equals the first word of "mi amas vin"...
# so w = "m"
# NOW we go into the ESPERANTO_ALPHABET constant and find where "m" is within the set of letters.
# "m" is the 16th index of the ESPERANTO_ALPHABET constant so our 'map' method adds it to a new array
# so after the first iteration in our 'map' we have [16]
# in this case, after the second iteration in our 'map' we have the array [16,12]
# this is because our second letter is "i" which is the 12th index within the ESPERANTO_ALPHABET
# this process continues on until all letters of the current word have been iterated over
# after all of our 'map' iterations, an array of indices of where each of our letters falls in the ESPERANTO_ALPHABET is returned to sort_by
# this new array of indices will replace...
##["m", "i", " ", "a", "m", "a", "s", " ", "v", "i", "n"]
##with
##[16, 12, #, #, #, #, #, #, #, #, #] (each index from map for the word)
# sort_by then iterates to the next word and the process continues until ALL words have arrays of indices
# sort_by then, compares sets of our words by the new indices and sorts accordingly
  # if the first index of one word is greater than that of the second word then 1 will be returned and the items will be swapped in place
  # if "  " is less than " " you will get -1 and the words will be left in place because the first word is already less than the second
  # if they are equal than nothing is swapped and the pair is left in it's current place
# CONGRATULATIONS! We now have a sorted array based on the ESPERANTO_ALPHABET!
# ["bonan matenon", "ĉu vi parolas esperanton", "mi amas vin", "pacon"]

##### extra unrelated sort example: [2,1,3,4,5].sort { |a, b| a <=> b } -- compares 1 to 2 and then swaps them in place (if needed)
  # our array is now [1,2,3,4,5] and the next iteration will compare 2 and 3 and so on.

def alphabetize(arr)
  arr.sort_by do |w|
    w.split('').map do |l|
      ESPERANTO_ALPHABET.index(l)
    end
  end
end

# alphabetize(["mi amas vin", "bonan matenon", "pacon", "ĉu vi parolas esperanton"])
