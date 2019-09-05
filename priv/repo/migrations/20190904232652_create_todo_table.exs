defmodule TodoApp.Repo.Migrations.CreateTodoTable do
  use Ecto.Migration

  def change do
    create table("todos") do
      add :name, :string
      add :done, :boolean, defaut: true
    end
  end
end
