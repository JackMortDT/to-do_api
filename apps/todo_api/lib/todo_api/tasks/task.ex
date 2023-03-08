defmodule TodoApi.Tasks.Task do
  @moduledoc """
  Represent a task of the user
  """
  alias __MODULE__
  use TodoApi.Schema
  import Ecto.Changeset

  alias TodoApi.Users.User

  @required []
  @optional ~w(title description due_date completed)a

  schema "tasks" do
    field :title, :string
    field :description, :string
    field :due_date, :naive_datetime
    field :completed, :boolean, default: false

    belongs_to :user, User

    timestamps()
  end

  @type t() :: %Task{}

  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, @optional ++ @required)
    |> validate_required(@required)
  end
end
