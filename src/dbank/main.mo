import Debug "mo:base/Debug";

actor DBank {
  // var is changeable
  var currentValue = 300;
  // := reassigns the value in motoko
  currentValue := 100;
  // let is a constant and cannot be changed
  let id = 1035;
  // only prints strings
  // Debug.print("hello");
  // to print other types, must use debug_show() as well
  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

  // adding public in front allows it to be called from outside the canister
  public func topUp() {
    currentValue += 1;
    Debug.print(debug_show(currentValue));
  };

  // can call from the command line using 'dfx canister call <canister_name> <command>'
  // i.e. dfx canister call dbank topUp
  // topUp();

}

// Motoko style guide: https://legacy.internetcomputer.org/docs/motoko/style#style
// lowerCamelCase for variables, etc, things that can change
// UpperCamelCase for classes, etc
// actor = class = canister in this case
// in order to run code, first need to deploy it
// dfx start
// dfx deploy in another terminal to deploy canister to the simulated computer blockchain started by dfx start terminal
