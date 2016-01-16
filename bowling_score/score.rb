class Score
  def calculate( throws )
    get_eligible_throws( throws ).inject :+
  end

  private

  def get_eligible_throws( throws )
    throws[ 0 .. throws.length / 2 * 2 - 1 ]
  end


  class State
    def throw

    end
  end

end

