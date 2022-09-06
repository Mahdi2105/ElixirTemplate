defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel
  alias Discuss.{Topic, Repo, Comment}
  import Ecto

  def join("comments:" <> topic_id, _params, socket) do
    topic_id = String.to_integer(topic_id)
    topic = Repo.get(Topic, topic_id)

    {:ok, %{}, assign(socket, :topic, topic)}

    # if authorized?(_params) do
    #   {:ok, socket}
    # else
    #   {:error, %{reason: "unauthorized"}}
    # end
  end

  def handle_in(_name, %{"content" => content}, socket) do
    topic = socket.assigns.topic

    changeset =
      topic
      |> build_assoc(:comments)
      |> Comment.changeset(%{content: content})

    case Repo.insert(changeset) do
      {:ok, comment} ->
        {:reply, :ok, socket}

      {:error, reason} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end
  end

  # Add authorization logic here as required.
  # defp authorized?(_payload) do
  #   true
  # end
end
