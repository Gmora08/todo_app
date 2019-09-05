defmodule TodoApp.Todo do
  alias TodoApp.Todo
  use Ecto.Schema
  import Ecto.Changeset
  alias TodoApp.Repo

  schema "todos" do
    field :name, :string
    field :done, :boolean, default: false
  end

  def changeset(todo, params \\ %{}) do
    todo
    |> cast(params, [:name, :done])
    |> validate_required([:name])
  end

  def create_todo(params) do
    %Todo{}
    |> changeset(params)
    |> Repo.insert()
  end
end