defmodule TodoApi.Settings.Setting do
  @moduledoc """
  Settings for user applications
  """
  alias __MODULE__
  use TodoApi.Schema
  import Ecto.Changeset

  alias TodoApi.Users.User

  @required ~w(user_id)a
  @optional ~w(theme notifications)a

  schema "settings" do
    field :theme, :string
    field :notifications, :boolean, default: false

    belongs_to :user, User

    timestamps()
  end

  @type t() :: %Setting{}

  def changeset(%Setting{} = setting, attrs) do
    setting
    |> cast(attrs, @optional ++ @required)
    |> validate_required(@required)
  end
end
