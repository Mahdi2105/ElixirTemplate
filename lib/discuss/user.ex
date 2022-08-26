defmodule Discuss.User do
  use Ecto.Schema

  alias Ecto.Changeset

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    has_many :topics, Discuss.Topic

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> Changeset.cast(params, [:email, :provider, :token])
    |> Changeset.validate_required([:email, :provider, :token])
  end
end
