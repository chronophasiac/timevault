describe "Timevault controllers", ->
  beforeEach module("timevault")

  describe "PomodoroIndexCtrl", ->
    it "should set pomodoros to an empty array", inject(($controller) ->
      scope = {}
      ctrl = $controller("PomodoroIndexCtrl",
        $scope: scope
      )
      expect(scope.pomodoros.length).toBe 0
    )
