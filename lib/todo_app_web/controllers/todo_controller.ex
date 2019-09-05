defmodule TodoAppWeb.TodoController do
  use TodoAppWeb, :controller
  alias TodoApp.Todo
  alias TodoApp.Repo

  def index(conn, _params) do
    todos = Repo.all(Todo)

    render(conn, "index.json", todos: todos)
  end

  def create(conn, params) do
    with {:ok, todo} <- Todo.create_todo(params) do
      conn
      |> put_status(:created)
      |> render("show.json", todo: todo)
    end
  end
end