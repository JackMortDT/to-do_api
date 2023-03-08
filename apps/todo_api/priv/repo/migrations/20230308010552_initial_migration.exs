defmodule TodoApi.Repo.Migrations.InitialMigration do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :username, :string, null: false
      add :email, :string, null: false
      add :first_name, :string
      add :last_name, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:users, :username)
    create unique_index(:users, :email)

    create table(:tasks, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :title, :string
      add :description, :string
      add :due_date, :naive_datetime
      add :completed, :boolean

      add :user_id, references(:users, type: :uuid), null: false

      timestamps()
    end

    create table(:categories, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :name, :string, null: false

      add :user_id, references(:users, type: :uuid), null: false

      timestamps()
    end

    create table(:task_categories, primary_key: false) do
      add :task_id, references(:tasks, type: :uuid), null: false
      add :category_id, references(:category, type: :uuid), null: false
    end

    create table(:settings, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :theme, :string
      add :notifications, :boolean

      timestamps()
    end
  end
end
