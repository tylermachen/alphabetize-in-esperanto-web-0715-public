ESPERANTO_ALPHABET = "abcĉdefgĝhĥijĵklmnoprsŝtuŭvz"

def alphabetize(arr)
  arr.sort_by { |w| w.split('').map { |l| ESPERANTO_ALPHABET.index(l) }}
end