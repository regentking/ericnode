test "it will pass", ->
  stop()
  describe.it = true
  setTimeout ->
    equals( describe.it, "true" )
    start
  , 150
  