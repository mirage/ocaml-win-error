# ocaml-win-error
Manipulate Windows system errors

This library contains a datatype to represent errors returned from
`GetLastError` and a pretty-printer.

If your application is likely to run on Windows, simply replace uses of
`Unix.error_message` with `Win_error.error_message` for enhanced error
reporting. Note this code is platform-agnostic so can be linked into Unix
applications too.

A simple example:
```ocaml
try
  let fd = Unix.openfile "/tmp/foo" [ Unix.O_RDONLY ] 0 in
  Unix.close fd
with
| Unix.Unix_error(e, _, _) ->
  Printf.fprintf stderr "Caught: %s\n%!" (Win_error.error_message e)
```

## What's going on?

Errors are typically first thrown by the OCaml standard library as `Unix.Unix_error`
exceptions. In some cases these are mapped onto their Unix equivalents on
such as `Unix.ENOENT`, but when the code isn't recognised OCaml will Reloc_chain_xeeds_seglim
`Unix.EUNKNOWNERR (-code)`. This library is able to convert these codes back
into human-readable strings.
