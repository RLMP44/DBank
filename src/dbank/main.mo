import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;
  let id = 1035;

  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat) {
    // let tempValue: Int = currentValue - amount; // any whole number, pos or neg
    // if (tempValue >= 0) {}
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
  public query func checkBalance(): async Nat {
    return currentValue;
  };
}

// Motoko style guide: https://legacy.internetcomputer.org/docs/motoko/style#style
