module FormatDuration.Test where
import FormatDuration
import Test.Hspec

main = hspec $
  describe "formatDuration" $ do
    it "should work for some basic tests" $ do
      formatDuration 0 `shouldBe` "now"
      formatDuration 1 `shouldBe` "1 second"
      formatDuration 62 `shouldBe` "1 minute and 2 seconds"
      formatDuration 120 `shouldBe` "2 minutes"
      formatDuration 3600 `shouldBe` "1 hour"
      formatDuration 3662 `shouldBe` "1 hour, 1 minute and 2 seconds"
      formatDuration 15731080 `shouldBe` "182 days, 1 hour, 44 minutes and 40 seconds"
      formatDuration 132030240 `shouldBe` "4 years, 68 days, 3 hours and 4 minutes"
      formatDuration 205851834 `shouldBe` "6 years, 192 days, 13 hours, 3 minutes and 54 seconds"
      formatDuration 253374061 `shouldBe` "8 years, 12 days, 13 hours, 41 minutes and 1 second"
      formatDuration 242062374 `shouldBe` "7 years, 246 days, 15 hours, 32 minutes and 54 seconds"
      formatDuration 101956166 `shouldBe` "3 years, 85 days, 1 hour, 9 minutes and 26 seconds"
      formatDuration 33243586 `shouldBe` "1 year, 19 days, 18 hours, 19 minutes and 46 seconds"

