defmodule ScholarrWeb.Course.CourseComponents do
  use ScholarrWeb, :html
  use Phoenix.HTML
  import ScholarrWeb.AppComponents
  alias ScholarrWeb.Course.VideoComponent
  alias Scholarr.Filesystem.File

  attr :course, :map
  attr :modules, :map
  slot :inner_block

  def course_sidebar(assigns) do
    ~H"""
    <div class="flex flex-col w-1/3 h-full p-8 border-l border-opacity-50">
      <div class="flex flex-col gap-6 mb-6 ">
        <div>
          <button class="px-6 py-2 text-sm font-bold text-blue-500 uppercase transition-colors duration-150 ease-in-out rounded-md ring-2 ring-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-800">
            Back
          </button>
        </div>

        <span class="text-lg font-bold">
          <%= @course.display_name %>
        </span>
      </div>
      <div class="flex flex-col gap-4">
        <%= for module <- @modules do %>
          <div class="flex flex-col gap-4 p-6 font-bold border rounded-md bg-gray-50">
            <div class="flex flex-row justify-between">
              <span><%= module.folder_name %></span>
              <span>15:00</span>
            </div>
            <%= for lesson <- lesson_videos(module) do %>
              <.lesson
                id={lesson.id}
                name={lesson.file_name}
                time="02:35"
                progress="inactive"
                patch={"#{@course.url}?lesson=#{lesson.id}"}
              />
            <% end %>
            <%!-- <.lesson name="Choosing right tools" time="02:30" progress="active" id="active" /> --%>
            <%!-- <.lesson name="Defining color scheme" time="02:30" progress="inactive" id="inactive" /> --%>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  attr :conn, :map
  attr :changeset, :map
  attr :edit, :boolean
  attr :lesson, :string
  attr :module, :map
  slot :inner_block

  def course_content(assigns) do
    assigns =
      assigns
      |> assign(
        :file,
        Enum.map(assigns.module, fn k -> k.file end)
        |> List.flatten()
        |> Enum.filter(&(&1.id == assigns.lesson))
        |> hd()
      )

    ~H"""
    <div class="flex flex-col flex-1 p-8">
      <%!-- <div><%= inspect(@file) %></div> --%>
      <%!-- <div :if={@file != nil} id="player">
        <video
          id="video"
          controls
          crossorigin="anonymous"
          class="w-auto h-auto rounded-lg drop-shadow-lg video-js"
        >
          <source src={source_path(@file)} type="video/webm" />
          <source src={~p"/watch/#{@file.id}"} type="video/mp4" />
          <p class="vjs-no-js">
            To view this video please enable JavaScript, and consider upgrading to a
            web browser that
            <a href="https://videojs.com/html5-video-support/" target="_blank">
              supports HTML5 video
            </a>
          </p>
        </video>
      </div> --%>
      <.live_component module={VideoComponent} id="videoComponent" file={@file} />
      <div class="flex flex-row justify-end py-4 border-b">
        <div class="flex flex-row gap-4">
          <span class="flex items-center justify-center w-8 h-8 text-red-500 rounded-full shadow-lg mdi mdi-heart">
          </span>
          <span class="flex items-center justify-center w-8 h-8 text-gray-500 rounded-full shadow-lg mdi mdi-pin">
          </span>
          <span class="flex items-center justify-center w-8 h-8 text-gray-500 rounded-full shadow-lg mdi mdi-dots-vertical">
          </span>
        </div>
      </div>
      <div class="flex flex-col items-center gap-6 my-6">
        <div class="flex items-center justify-between w-full">
          <div class="flex flex-row flex-1 w-auto pr-6">
            <div class="w-full">
              <.form
                :let={f}
                for={@changeset}
                onkeydown="return event.key != 'Enter';"
                class="flex flex-row gap-2"
              >
                <label
                  class="flex items-center justify-center w-8 gap-2 mdi mdi-pencil"
                  for="file_name"
                  phx-click="edit"
                >
                </label>
                <%= text_input(f, :name,
                  value: @file.file_name,
                  class:
                    "border-b-2 border-0 border-white w-full text-lg font-bold m-0 p-0 focus:outline-none focus:ring-0 focus:border-transparent  #{if @edit, do: "border-b-2 focus:border-blue-600 "}",
                  readonly: !@edit,
                  phx_blur: if(@edit, do: "change_file_name"),
                  autocomplete: false
                ) %>
              </.form>
            </div>
          </div>
          <div>
            <button
              class="px-6 py-2 text-sm font-bold text-blue-500 uppercase transition-colors duration-150 ease-in-out rounded-md ring-2 ring-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-800"
              phx-click={JS.dispatch("reload_video")}
            >
              NEXT CHAPTER
            </button>
          </div>
        </div>
        <span>
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Expedita minima repellat ducimus accusantium provident ipsa fuga a explicabo libero porro similique delectus ab voluptatibus repudiandae dolorem blanditiis animi, molestias dicta.
          Aut, neque non. Inventore sunt officia architecto? Quaerat, fugiat est dolorem, cumque nihil recusandae molestias atque illum sed voluptatum error! Vero cumque similique molestias alias facere quas ducimus quos dicta.
        </span>
        <div class="flex flex-row items-center w-full h-12 overflow-hidden font-bold border divide-x divide-gray-200 rounded-lg divide-solid bg-gray-50 justify-evenly">
          <div class="flex items-center justify-center flex-1 h-full text-gray-500 transition-colors duration-150 ease-in-out cursor-default hover:bg-blue-500 hover:text-white">
            Attached Files
          </div>
          <div class="flex items-center justify-center flex-1 h-full text-gray-500 transition-colors duration-150 ease-in-out cursor-default hover:bg-blue-500 hover:text-white">
            Comments
          </div>
          <div class="flex items-center justify-center flex-1 h-full text-gray-500 transition-colors duration-150 ease-in-out cursor-default hover:bg-blue-500 hover:text-white">
            Critique Reviews
          </div>
          <div class="flex items-center justify-center flex-1 h-full text-gray-500 transition-colors duration-150 ease-in-out cursor-default hover:bg-blue-500 hover:text-white">
            Challenges
          </div>
          <div class="flex items-center justify-center flex-1 h-full text-gray-500 transition-colors duration-150 ease-in-out cursor-default hover:bg-blue-500 hover:text-white">
            More from Jesse
          </div>
        </div>
      </div>
    </div>
    """
  end

  attr :name, :string
  attr :time, :string
  attr :progress, :string
  attr :patch, :string, default: nil
  attr :id, :string
  slot :inner_block

  def lesson(assigns) do
    assigns =
      assigns
      |> assign(
        :status,
        case assigns.progress do
          "completed" ->
            %{
              icon: "mdi-check",
              icon_color: "text-white",
              icon_color_hex: "#ffffff",
              icon_bg: "bg-green-500",
              icon_bg_hex: "#22c55e",
              text_color: "text-gray-400",
              text_color_hex: "#9ca3af"
            }

          "active" ->
            %{
              icon: "mdi-pause",
              icon_color: "text-blue-500",
              icon_color_hex: "#3b82f6",
              icon_bg: "bg-blue-100",
              icon_bg_hex: "#dbeafe",
              text_color: "text-blue-500",
              text_color_hex: "#3b82f6"
            }

          "inactive" ->
            %{
              icon: "mdi-play",
              icon_color: "text-blue-500",
              icon_color_hex: "#3b82f6",
              icon_bg: "bg-blue-100",
              icon_bg_hex: "#dbeafe",
              text_color: "text-gray-600",
              text_color_hex: "#4b5563"
            }
        end
      )

    ~H"""
    <div class={"flex flex-row items-center justify-between text-sm #{@status.text_color}"} id={@id}>
      <div class="flex flex-row items-center gap-2">
        <div class="relative p-1 rounded-full progress">
          <.icon
            icon={@status.icon}
            icon_color={@status.icon_color}
            rounded
            icon_bg={@status.icon_bg}
          />
        </div>
        <.link patch={@patch} class="cursor-pointer hover:underline-offset-4 hover:underline">
          <%= @name %>
        </.link>
      </div>
      <span><%= @time %></span>
    </div>
    """
  end

  def source_path(file = %File{}),
    do: Path.join(file.file_path, [file.file_name, file.file_extension])

  @video_extensions [".mp4", ".mkv", ".avi"]
  def lesson_videos(module) do
    Enum.filter(module.file, &Enum.member?(@video_extensions, &1.file_extension))
  end

  @file_extensions [".txt", ".pdf", ".doc", ".docx", ".ppt", ".pptx", ".xls", ".xlsx"]
  def lesson_files(module) do
    Enum.filter(module.file, &Enum.member?(@file_extensions, &1.file_extension))
  end
end
