"""
How do I use [partial application](https://tutorial.ponylang.io/expressions/partial-application.html) on a lambda?

We can call the method `apply` on the object literal that the lambda represents.
"""
actor Main
  new create(env: Env) =>
    let add = {(a: F32, b: F32): F32 => a + b }
    let add_three = add~apply(3)
    env.out.print(add_three(7).string())
