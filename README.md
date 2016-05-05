# ocaml-win-error
Manipulate Windows system errors

This library contains a datatype to represent errors returned from
`GetLastError` and a pretty-printer.

To use it:
```ocaml
try
  let fd = Unix.openfile "/tmp/foo" [ Unix.O_RDONLY ] 0 in
  Unix.close fd
with
| Unix.Unix_error(e, _, _) ->
  let msg = match Win_error.of_unix_error e with
    | None -> Unix.error_message e
    | Some e -> Win_error.error_message e in
  Printf.fprintf stderr "Caught: %s\n%!" msg
```

Note that these errors will typically be first thrown as Unix_errors
by the OCaml standard library. If OCaml recognises the error code then
it will translate it into the Unix equivalent (e.g. ENOENT). Otherwise
the errors are converted into Unix.EUNKNOWNERR (-code).
