open Board
open Sprite
open Command

(*Type board represents the coordinate board with objects in it*)
type board = Board.board

type phase =
  |Start
  |Active
  |End
(*Type state represents the current game state, including information
  such as monster locations, HP levels, rows until next boss, and game over
  type state = {
    bgd: sprite;
    context: Dom_html.canvasRenderingContext2D Js.t;
    mutable score: int;
    mutable game_over: bool;
  }*)

type state = {
  mutable board : (obj option) list list;
  mutable control : control;
  mutable player: obj option;
  mutable projectile_list: obj option list;
  mutable mons_list: (obj option) list;
  mutable mons_row_counter: int;
  mutable mons_type_counter: int;
  mutable score : int;
  mutable phase : phase;
  mutable level : int;
  mutable comet_interval : int;
  mutable item_count : int;
  mutable item_msg : string
}

(*[update_state] changes the state according to the command that was given
and moving the rows of monsters down by one each iteration*)
(* val update_state : Command.command -> state -> state *)
(*every command, you should also update the hp of the monsters
  and of the sprite itself *)

(*val update_state : Dom_html.canvasElement Js.t
  -> unit*)


val update_state: state -> player -> unit

val make_state: int -> int -> state

val draw_state: Dom_html.canvasRenderingContext2D Js.t -> state -> unit

(*[update_objs_loop state] takes [state] and extracts fields [mon_list], [player]
  and [projectile_list] and calls [update_obj] on those fields.*)
val update_objs_loop: state -> unit list
