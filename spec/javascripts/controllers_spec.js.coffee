describe "Timevault controllers", ->
  beforeEach module("timevault")

  describe "IntervalIndexCtrl", ->
    it "should set intervals to an empty array", inject(($controller) ->
      scope = {}
      ctrl = $controller("IntervalIndexCtrl",
        $scope: scope
      )
      expect(scope.intervals.length).toBe 0
    )
