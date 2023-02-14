Definition message :=
  "Hello, World!".

Definition main :=
  _crate.io._print (new_v1 ["";"\n"] [new_display message]) ;;
  tt ;;
  let number := Some 7 in
  let letter := None in
  let emoticon := None in
  if let_if Some (i) := number then
    _crate.io._print (new_v1 ["Matched ";"!\n"] [new_debug i]) ;;
    tt ;;
    tt
  else
    tt ;;
  if let_if Some (j) := letter then
    _crate.io._print (new_v1 ["Matched ";"!\n"] [new_debug j]) ;;
    tt ;;
    tt
  else
    _crate.io._print
      (new_v1 ["Didn't match a number. Let's go with a letter!\n"] []) ;;
    tt ;;
    tt ;;
  let i_like_letters := false in
  if let_if Some (i) := emoticon then
    _crate.io._print (new_v1 ["Matched ";"!\n"] [new_debug i]) ;;
    tt ;;
    tt
  else
    if i_like_letters then
      _crate.io._print
        (new_v1 ["Didn't match a number. Let's go with a letter!\n"] []) ;;
      tt ;;
      tt
    else
      _crate.io._print
        (new_v1 ["I don't like letters. Let's go with an emoticon :)!\n"] []) ;;
      tt ;;
      tt.