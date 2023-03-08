defmodule TodoApi.Tasks.Category do
  @moduledoc """
  Categories created by user and belongs to task
  """
  alias __MODULE__
  use TodoApi.Schema
  import Ecto.Changeset

  alias TodoApi.Users.User

  @required ~w(name user_id)a
  @optional []

  schema "category" do
    field :name, :string

    belongs_to :user, User

    timestamps()
  end

  @type t() :: %Category{}

  def changeset(%Category{} = category, attrs) do
    category
    |> cast(attrs, @optional ++ @required)
    |> validate_required(@required)
  end
end
