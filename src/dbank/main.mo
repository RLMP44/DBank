import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  // 'stable' turns the variable from flexible to persisted
  // persists through re-deploys
  stable var currentValue: Float = 300;
  // currentValue := 300;
  Debug.print(debug_show(currentValue));
  let id = 1035;
  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    if (amount <= currentValue) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("insufficient funds");
      Debug.print(debug_show(currentValue));
    }
  };

  // must add "query" for query calls
  // when returning something, must include "async" and returning type
  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound(): async Float {
    let currentTime = Time.now();
    let interest : Float = 1.01;
    let secondsElapsed: Int = (currentTime - startTime) / 1000000000;
    currentValue := currentValue * (interest ** Float.fromInt(secondsElapsed));
    startTime := currentTime;
    return currentValue;
  };
}

// Motoko style guide: https://legacy.internetcomputer.org/docs/motoko/style#style
