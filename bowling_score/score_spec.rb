require_relative './score.rb'

RSpec.describe Score do

  it "can init a `Score` object" do
    expect( subject ).to_not be_nil
  end

  context "a simple score" do
    it "scores a single pin" do
      expect( subject.calculate( [1] )).to eq( 1 )
    end
    it "scores multiple frames" do
      expect( subject.calculate( [2] * 18 )).to eq( 36 )
    end
    it "provides partial scores for unfinished games" do
      expect( subject.calculate( [2] * 6 )).to eq( 12 )
    end
    it "excludes partial frames from the score" do
      expect( subject.calculate( [2] * 7 )).to eq( 12 )
    end
  end

  context "a spare has been thrown" do
    let( :current_score ) { [0,8,1,9] }

    it "excludes spare frame until subsequent ball" do
      expect( subject.calculate( current_score )).to eq( 8 )
    end

  end

end

