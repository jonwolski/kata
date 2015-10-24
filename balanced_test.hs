import Test.Hspec
import Balanced.Parens
import Data.List (sort)

main = hspec $ do
  describe "Basic Tests" $ do
    it "n = 0" $ do
      (sort . balancedParens) 0 `shouldBe` [""]
    it "n = 1" $ do
      (sort . balancedParens) 1 `shouldBe` ["()"]
    it "n = 2" $ do
      (sort . balancedParens) 2 `shouldBe` ["(())","()()"]
    it "n = 3" $ do
      (sort . balancedParens) 3 `shouldBe` ["((()))","(()())","(())()","()(())","()()()"]
    it "n = 4" $ do
      (sort . balancedParens) 4 `shouldBe` ["(((())))","((()()))","((())())","((()))()","(()(()))","(()()())","(()())()","(())(())","(())()()","()((()))","()(()())","()(())()","()()(())","()()()()"]
