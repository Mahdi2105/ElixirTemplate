defmodule Discuss.Topic do
  use Ecto.Schema

  alias Ecto.Changeset

  schema "topics" do
    field :title, :string
  end

  def changeset(topic, params \\ %{}) do
    topic
    |> Changeset.cast(params, [:title])
    |> Changeset.validate_required([:title])
  end
end
