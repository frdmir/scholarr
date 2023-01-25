defmodule ScholarrWeb.WatchController do
  use ScholarrWeb, :controller
  alias Scholarr.Filesystem

  def show(%{req_headers: req_headers} = conn, %{"id" => id}) do
    video = Filesystem.get_file!(id)
    send_video(conn, req_headers, video)
  end

  def send_video(conn, headers, video) do
    video_path = Path.join(video.file_path, [video.file_name, video.file_extension])
    offset = get_offset(headers)
    file_size = get_file_size(video_path)

    conn
    |> Plug.Conn.put_resp_header("content-type", video.mime_type)
    |> Plug.Conn.put_resp_header("content-range", "bytes #{offset}-#{file_size - 1}/#{file_size}")
    |> Plug.Conn.send_file(206, video_path, offset, file_size - offset)
  end

  def get_offset(headers) do
    case List.keyfind(headers, "range", 0) do
      {"range", "bytes=" <> start_pos} ->
        String.split(start_pos, "-") |> hd |> String.to_integer()

      nil ->
        0
    end
  end

  def get_file_size(path) do
    {:ok, %{size: size}} = File.stat(path)
    size
  end
end
