class Silly {
   copy() : SELF_TYPE { self };
};
class Sally inherits Silly { 
	f(): String { "1" };
};


class Main {
   x : Sally <- (new Sally).copy();
   y : String;
   b: Bool <- tRue;   -- boolean type
   main() : Sally { x };
};
