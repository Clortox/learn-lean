method Max(lhs: int, rhs: int) returns (c: int)
    ensures c == lhs || c == rhs
    ensures c == lhs ==> lhs >= rhs
    ensures c == rhs ==> rhs >= rhs
    ensures lhs == rhs ==> c == lhs || c == rhs
{
    if lhs == rhs {
        return lhs;
    }

    if lhs > rhs {
        return lhs;
    } else {
        return rhs;
    }
}



// Exercise 2. Using a precondition, change Abs to say it can only be called on negative values. Simplify the body of Abs into just one return statement and make sure the method still verifies.
method Absex2(x: int) returns (y: int)
    requires x < 0
    ensures 0 <= y
    ensures 0 <= x ==> y == x
    ensures x < 0 ==> y == -x
{
    return -x;
}

// Exercise 3. Keeping the postconditions of Abs the same as above, change the body of Abs to just y := x + 2. What precondition do you need to annotate the method with in order for the verification to go through? What precondition do you need if the body is y := x + 1? What does that precondition say about when you can call the method?
method Abs(x: int) returns (y: int)
    // Add a precondition here so that the method verifies.
    // Don't change the postconditions.

    requires x == -1 

    ensures 0 <= y
    ensures 0 <= x ==> y == x
    ensures x < 0 ==> y == -x
{
    y:= x + 2;
}

method Abs2(x: int) returns (y: int)
    // Add a precondition here so that the method verifies.
    // Don't change the postconditions.

    requires x + 1 == -x

    ensures 0 <= y
    ensures 0 <= x ==> y == x
    ensures x < 0 ==> y == -x
{
    y:= x + 1;
}


// Exercise 4. Write a function max that returns the larger of two given integer parameters. Write a test method using an assert that checks that your function is correct.
function max(a: int, b: int): int
{
    if a >= b then a else b
}

method ex4_testing() {
    assert max(5,10) == 10;
    assert max(5,5) == 5;
    assert max(11,2) == 11;
}

function fib(n : nat): nat {
    if n == 0 then 0
    else if n == 1 then 1
    else fib(n - 1) + fib(n - 2)
}

method computeFib(n : nat) returns (b: nat) 
    ensures b == fib(b)
{

    if n == 0 {
        return 0;
    }

    assert n >= 1;

    var i : int := 1;
    var a : int := 0;
    b := 1;

    while i < n 
        invariant 0 < i <= n
        invariant a == fib(i - 1)
        invariant b == fib(i)
    {

        a, b := b, a + b;

        i := i + 1;
    } 

}

// Exercise 10. In the loop above, the invariant i <= n and the negation of the loop guard allow us to conclude i == n after the loop (as we checked previously with an assert. 
// Note that if the loop guard were instead written as i != n (as in Exercise 7), then the negation of the guard immediately gives i == n after the loop, regardless of the loop invariant. 
// Change the loop guard to i != n and delete the invariant annotation. Does the program verify? What happened?
//
// fails to verify
method m()
{
  var i, n := 0, 20;
  while i != n
  {
    i := i + 1;
  }
}





method Testing() {
    var low: int := 5;
    var high: int := 10;

    var maxValue := Max(low, high);

    assert maxValue >= low;
    assert maxValue <= high;

    assert maxValue == high;
    assert maxValue > low;

    assert 2 < 3;

}