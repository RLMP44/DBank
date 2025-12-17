import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;
  let id = 1035;

  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };
}

// Motoko style guide: https://legacy.internetcomputer.org/docs/motoko/style#style
