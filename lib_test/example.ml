let _ =
  try
    let fd = Unix.openfile "/tmp/foo" [ Unix.O_RDONLY ] 0 in
    Unix.close fd
  with
  | Unix.Unix_error(e, _, _) ->
    let msg = match Win_error.of_unix_error e with
      | None -> Unix.error_message e
      | Some e -> Win_error.error_message e in
    Printf.fprintf stderr "Caught: %s\n%!" msg
