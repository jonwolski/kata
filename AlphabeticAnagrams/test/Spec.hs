{-# LANGUAGE NumericUnderscores #-}
import Lib
import Test.Hspec

main = hspec spec
spec = do
  describe "lexiPos" $ do
    it "testing 'A'" $ shouldBe (lexiPos "A") 1
    it "testing 'ABAB'" $ shouldBe (lexiPos "ABAB") 2
    it "testing 'AAAB'" $ shouldBe (lexiPos "AAAB") 1
    it "testing 'BAAA'" $ shouldBe (lexiPos "BAAA") 4
    it "testing 'QUESTION'" $ shouldBe (lexiPos "QUESTION") 24_572
    it "testing 'BOOKKEEPER'" $ shouldBe (lexiPos "BOOKKEEPER") 10_743
    it "testing 'IMMUNOELECTROPHORETICALLY'" $ shouldBe (lexiPos "IMMUNOELECTROPHORETICALLY") 718__393_983_731__145_698_173
