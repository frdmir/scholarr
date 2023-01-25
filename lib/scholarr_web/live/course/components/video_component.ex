defmodule ScholarrWeb.Course.VideoComponent do
  use ScholarrWeb, :live_component

  @impl true
  def update(assigns, socket) do
    {:ok, socket |> assign(assigns) |> push_event("reload_video", %{id: assigns.file.id})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="player">
      <video
        id="video"
        controls
        crossorigin="anonymous"
        class="w-full h-full rounded-lg drop-shadow-lg video-js"
      >
        <%!-- <source src={source_path(@file)} type="video/webm" /> --%>
        <source id="video-source" src={~p"/watch/#{@file.id}"} type="video/mp4" />
        <p class="vjs-no-js">
          To view this video please enable JavaScript, and consider upgrading to a
          web browser that
          <a href="https://videojs.com/html5-video-support/" target="_blank">
            supports HTML5 video
          </a>
        </p>
      </video>
      <span id="progress"></span>
    </div>
    """
  end
end
