(* Yoann Padioleau
 *
 * Copyright (C) 2024 Semgrep Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * version 2.1 as published by the Free Software Foundation, with the
 * special exception on linking described in file LICENSE.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the file
 * LICENSE for more details.
 *)

(*****************************************************************************)
(* Prelude *)
(*****************************************************************************)
(* Extensions to Uri.ml
 *)

(*****************************************************************************)
(* API *)
(*****************************************************************************)

let of_string_opt (str : string) : Uri.t option =
  let uri = Uri.of_string str in
  if Uri.equal uri Uri.empty then None else Some uri


let url_regex = Pcre2_.regexp "^https?://"
let is_url config_path = 
  Pcre2_.pmatch_noerr ~rex:url_regex config_path
