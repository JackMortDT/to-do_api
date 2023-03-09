defmodule TodoApi.Users.User do
  @moduledoc """
  Represent a single user
  """
  alias __MODULE__
  use TodoApi.Schema
  import Ecto.Changeset
  import TodoApi.Utils.Regex, only: [email_regex: 0]

  alias TodoApi.Tasks.{Category, Task}

  @required ~w(username email)a
  @optional ~w(first_name last_name)a

  schema "users" do
    field :username, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string

    has_many :tasks, Task
    has_many :categories, Category

    timestamps()
  end

  @type t() :: %User{}

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, @optional ++ @required)
    |> validate_required(@required)
    |> validate_format(:email, email_regex())
  end
end
