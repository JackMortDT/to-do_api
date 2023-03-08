defmodule TodoApi.Users.User do
  @moduledoc """
  Represent a single user
  """
  alias __MODULE__
  use TodoApi.Schema
  import Ecto.Changeset

  @required ~w(username email)a
  @optional ~w(first_name last_name)a

  schema "users" do
    field :username, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @type t() :: %User{}

  def changeset(attrs) do
    %User{}
    |> cast(attrs, @optional ++ @required)
    |> validate_required(@required)
  end
end
