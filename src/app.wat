(module
  (import "console" "log" (func $log (param i32)))
  (import "console" "logString" (func $logString (param i32 i32)))
  (import "js" "mem" (memory 1))
  (func (export "add") (param $lhs i32) (param $rhs i32) (result i32)
        get_local $lhs
        get_local $rhs
        i32.add
  )

  ; push 42 as i32 to stack
  (func $getAnswer (result i32)
    i32.const 42
  )
  (func (export "getAnswerPlus1") (result i32)
    call $getAnswer
    i32.const 1
    i32.add
  )

  ; call JavaScript's function
  (func (export "logIt")
    i32.const 100
    call $log)

  ; use string
  (data (i32.const 0) "Hi!!!")
  (func (export "writeHi")
    i32.const 0  ;; pass offset 0 to log
    i32.const 5  ;; pass length 5 to log
    call $logString)

  ; define table
  (table 2 anyfunc)
  (func $f1 (result i32)
    i32.const 42)
  (func $f2 (result i32)
    i32.const 13)
  (elem (i32.const 0) $f1 $f2)
  (type $return_i32 (func (result i32)))
  (func (export "callByIndex") (param $i i32) (result i32)
    get_local $i
    call_indirect (type $return_i32))
)
