import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  // := reassigns the value in motoko
  currentValue := 100;
  // only prints strings
  Debug.print("hello");
  // to print other types, must use debug_show() as well
  Debug.print(debug_show(currentValue));

}

// Motoko style guide: https://legacy.internetcomputer.org/docs/motoko/style#style
// lowerCamelCase for variables, etc, things that can change
// UpperCamelCase for classes, etc
// actor = class = canister in this case
// in order to run code, first need to deploy it
// dfx start
// dfx deploy in another terminal to deploy canister to the simulated computer blockchain started by dfx start terminal
