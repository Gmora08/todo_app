defmodule TodoAppWeb.TodoLive do
  use Phoenix.LiveView

  alias TodoApp.Todos
  alias TodoAppWeb.TodoLiveView

  def mount(_session, socket) do
    {:ok, assign(socket, todos: Todos.list_todos())}
  end

  def render(assigns) do
    TodoLiveView.render("todos.html", assigns)
  end
end
