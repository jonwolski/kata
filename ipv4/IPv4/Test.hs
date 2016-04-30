module IPv4.Test where
import IPv4 (int32ToIP)
import Test.Hspec

main = hspec $
  describe "int32ToIP" $ do
    it "should work for the examples" $ do
      int32ToIP 2154959208 `shouldBe` "128.114.17.104"
      int32ToIP 0          `shouldBe` "0.0.0.0"
      int32ToIP 2149583361 `shouldBe` "128.32.10.1"
