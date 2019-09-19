defmodule TodoAppWeb.TodoLive do
  use Phoenix.LiveView

  alias TodoApp.Todos
  alias TodoAppWeb.TodoLiveView

  def mount(_session, socket) do
    {:ok, fetch(socket)}
  end

  def handle_event("add", %{"todo" => todo}, socket) do
    Todos.create_todo(todo)

    {:noreply, fetch(socket)}
  end

  def render(assigns) do
    TodoLiveView.render("todos.html", assigns)
  end

  defp fetch(socket) do
    assign(socket, todos: Todos.list_todos())
  end
end
