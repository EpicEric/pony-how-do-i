"""
How do I create Pony code equivalent to the following Javascript example?

```js
function echo (value, cb){
  setTimeout(() => {
    cb(value)
  }, 0)
}

let i = 0
let next = (val) => {
  if (val) {
    console.log(val)
  }
  i++
  if (i < 22) {
    return echo(i, next)
  }
}
next()
```
"""
actor Echo
  be apply(value: U32, cb: {(U32)} val) =>
    cb(value)

actor Next
  let env: Env
  let echo: Echo = Echo
  var i: U32 = 0

  new create(env': Env) =>
    env = env'

  be apply(value': U32) =>
    if value' > 0 then env.out.print(value'.string()) end
    i = i + 1
    if i < 22 then
      echo.apply(i, {(value: U32)(next: Next tag = this) => next(value) })
    end
