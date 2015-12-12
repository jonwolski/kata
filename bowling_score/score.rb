class Score
  def calculate( frames )
    get_eligible_frames( frames ).inject :+
  end

  private

  def get_eligible_frames( frames )
    frames[ 0 .. frames.length / 2 * 2 - 1 ]
  end

end
