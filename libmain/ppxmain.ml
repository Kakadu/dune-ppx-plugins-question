let impl =
  let m =
    object
      inherit Ppxlib.Ast_traverse.map as super

      method! constant =
        function
        | Pconst_string (_s, _o) ->
            let s2 = String.concat " " !Libmain.registred_ones in
            Pconst_string (s2, None)
        | c -> super#constant c
    end
  in
  m#structure

let () = Ppxlib.Driver.register_transformation ~impl "libmain"
