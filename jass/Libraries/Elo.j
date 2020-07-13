//https://en.wikipedia.org/wiki/Elo_rating_system

library Elo

  globals
    private constant integer K = 30
  endglobals

  private function Probability takes real ratingA, real ratingB returns real
    return 1.0 * 1.0 / (1 + 1.0 * Pow(10, 1.0 * (ratingA - ratingB) / 400)) 
  endfunction

  public function DetermineRating takes real ratingA, real ratingB, boolean aWins, boolean getA returns real
    local real Pb = Probability(ratingA, ratingB) //Probability B wins
    local real Pa = Probability(ratingB, ratingA) //Probability A wins

    local real newRatingA
    local real newRatingB

    if aWins then
      set newRatingA = ratingA + K * (1 - Pa)
      set newRatingB = ratingB + K * (0 - Pb)
    else
      set newRatingA = ratingA + K * (1 - Pa)
      set newRatingB = ratingB + K * (0 - Pb)
    endif

    if getA then
      return newRatingA
    else
      return newRatingB
    endif
  endfunction

endlibrary