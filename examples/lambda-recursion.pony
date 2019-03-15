"""
How do I write a lambda that calls itself recursively?

Remember that lambdas are [object literals](https://tutorial.ponylang.io/expressions/object-literals.html#lambdas).
You can simply call its own `apply` method to recurse.
"""
actor Main
  new create(env: Env) =>
    // As an explicit object literal
    let factorial =
      object
        fun apply(x: U32): U32 =>
          if x == 0 then
            1
          else
            x * apply(x - 1)
          end
      end

    env.out.print(factorial(7).string())

    // As an implicit object literal
    let factorial' =
      {(n: USize): USize =>
        if n == 0 then
          1
        else
          n * apply(n - 1)
        end
      }
    env.out.print(factorial'(7).string())

    // TODO: With tail-call optimization
