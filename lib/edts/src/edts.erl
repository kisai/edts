%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% @doc
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%_* Module declaration =======================================================
-module(edts).

%%%_* Exports ==================================================================

%% API
-export([ init_node/1
        , is_edts_node/1
        , modules/1
        , nodes/0]).

%%%_* Includes =================================================================

%%%_* Defines ==================================================================

%%%_* Types ====================================================================

%%%_* API ======================================================================

%%------------------------------------------------------------------------------
%% @doc
%% Initializes a new edts node.
%% @end
%%
-spec init_node(node()) -> ok.
%%------------------------------------------------------------------------------
init_node(Node) ->
  edts_server:init_node(Node).

%%------------------------------------------------------------------------------
%% @doc
%% Returns true iff Node is registered with this edts instance.
%% @end
%%
-spec is_edts_node(node()) -> boolean().
%%------------------------------------------------------------------------------
is_edts_node(Node) ->
  edts_server:is_edts_node(Node).

%%------------------------------------------------------------------------------
%% @doc
%% Returns a list of all erlang modules available on Node.
%% @end
%%
-spec modules(node()) -> [module()].
%%------------------------------------------------------------------------------
modules(Node) ->
  edts_server:ensure_node_initialized(Node),
  edts_dist:call(Node, edts_xref, modules).


%%------------------------------------------------------------------------------
%% @doc
%% Returns a list of the edts_nodes currently registered with this
%% edts-instance.
%% @end
%%
-spec nodes() -> [node()].
%%------------------------------------------------------------------------------
nodes() ->
  edts_server:nodes().

%%%_* Internal functions =======================================================

%%%_* Emacs ====================================================================
%%% Local Variables:
%%% allout-layout: t
%%% erlang-indent-level: 2
%%% End:
