let _ =
  try
    let fd = Unix.openfile "/tmp/foo" [ Unix.O_RDONLY ] 0 in
    Unix.close fd
  with
  | Unix.Unix_error(e, _, _) ->
    Printf.fprintf stderr "Caught: %s\n%!" (Win_error.error_message e)
