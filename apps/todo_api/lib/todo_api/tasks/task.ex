defmodule TodoApi.Tasks.Task do
  @moduledoc """
  Represent a task of the user
  """
  alias __MODULE__
  use TodoApi.Schema
  import Ecto.Changeset

  alias TodoApi.Tasks.Category
  alias TodoApi.Users.User

  @required ~w(user_id)a
  @optional ~w(title description due_date completed)a

  schema "tasks" do
    field :title, :string
    field :description, :string
    field :due_date, :naive_datetime
    field :completed, :boolean, default: false

    belongs_to :user, User
    many_to_many :categories, Category, join_through: "task_categories"

    timestamps()
  end

  @type t() :: %Task{}

  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, @optional ++ @required)
    |> validate_required(@required)
  end
end
