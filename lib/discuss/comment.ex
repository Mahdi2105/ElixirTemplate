defmodule Discuss.Comment do
  use Ecto.Schema

  alias Ecto.Changeset

  schema "comments" do
    field :content, :string
    belongs_to :user, Discuss.User
    belongs_to :topic, Discuss.Topic

    timestamps()
  end

  def changeset(topic, params \\ %{}) do
    topic
    |> Changeset.cast(params, [:content])
    |> Changeset.validate_required([:content])
  end
end
