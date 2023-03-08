defmodule TodoApi.Tasks.TaskCategories do
  @moduledoc """
  Intermediate table between tasks and categories
  """
  use Ecto.Schema

  alias TodoApi.Tasks.{Category, Task}

  @primary_key false
  schema "task_categories" do
    belongs_to :task, Task
    belongs_to :category, Category
  end
end
