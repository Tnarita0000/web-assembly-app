(module
  (import "console" "log" (func $log (param i32)))
  (func (export "add") (param $lhs i32) (param $rhs i32) (result i32)
        get_local $lhs
        get_local $rhs
        i32.add
  )

  (func $getAnswer (result i32)
    i32.const 42
  )
  (func (export "getAnswerPlus1") (result i32)
    call $getAnswer
    i32.const 1
    i32.add
  )

  (func (export "logIt")
    i32.const 100
    call $log)
)
