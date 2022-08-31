defmodule Discuss.User do
  use Ecto.Schema

  alias Ecto.Changeset

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    has_many :topics, Discuss.Topic
    has_many :comments, Discuss.Comment

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> Changeset.cast(params, [:email, :provider, :token])
    |> Changeset.validate_required([:email, :provider, :token])
  end
end
