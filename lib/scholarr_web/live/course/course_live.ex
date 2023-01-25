defmodule ScholarrWeb.Course.CourseLive do
  use ScholarrWeb, :live_view
  # use Phoenix.HTML
  import ScholarrWeb.Course.CourseComponents
  # alias Phoenix.LiveView.JS
  alias Scholarr.Filesystem
  alias Scholarr.Repo
  alias Scholarr.Courses

  def mount(%{"course" => course}, _session, socket) do
    course =
      Courses.get_course_url(course)
      |> Repo.preload(:folder)

    assigns =
      socket
      |> assign(course: course)
      |> assign(modules: Filesystem.get_childrens!(course.folder.id))
      |> assign(edit: false)

    {:ok, assigns}
  end

  def handle_params(params, _url, socket) do
    # JS.dispatch("reload_video")

    case params["lesson"] do
      nil ->
        assigns =
          socket
          |> assign(:lesson, "")
          |> assign(:changeset, nil)

        {:noreply, assigns}

      lesson ->
        assigns =
          socket
          |> assign(:lesson, lesson)
          |> assign(:changeset, Filesystem.change_file(%Filesystem.File{}))
          |> assign(
            :file,
            Enum.map(socket.assigns.modules, fn k -> k.file end)
            |> List.flatten()
            |> Enum.filter(&(&1.id == lesson))
            |> hd()
          )

        {:noreply, assigns}
    end
  end

  def handle_event("edit", _, socket) do
    JS.focus(to: "file_name")
    {:noreply, update(socket, :edit, &(&1 = !&1))}
  end

  def handle_event("change_file_name", %{"value" => value}, socket) do
    if socket.assigns.file.file_name == value do
      assigns =
        socket
        |> update(:edit, &(&1 = !&1))

      {:noreply, assigns}
    else
      case Filesystem.rename_file(socket.assigns.file, value) do
        :ok ->
          case Filesystem.update_file(socket.assigns.file, %{file_name: value}) do
            {:ok, _} ->
              assigns =
                socket
                |> update(:edit, &(&1 = !&1))
                |> update(
                  :modules,
                  &(&1 = Filesystem.get_childrens!(socket.assigns.course.folder.id))
                )
                |> update(:file, &Map.update!(&1, :file_name, fn _ -> value end))
                |> put_flash(:info, "Title updated")

              {:noreply, assigns}

            {:error, %Ecto.Changeset{} = changeset} ->
              {:noreply, assign(socket, changeset: changeset)}
          end

        {:error, reason} ->
          IO.inspect(socket.assigns.file)
          {:noreply, socket |> put_flash(:error, reason)}
      end
    end
  end

  def handle_info({:item_updated, item}, socket) do
    {:noreply, push_event(socket, "highlight", %{id: "item-#{item.id}"})}
  end
end
