defmodule DiscussWeb.Plugs.SetUser do
  import Plug.Conn
  # import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do
  end

  # The params here is taken from "init"
  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)

      # con.assigns.user => user struct

      true ->
        assign(conn, :user, nil)
    end
  end
end
