defmodule ScholarrWeb.AppComponents do
  use ScholarrWeb, :html

  def navbar(assigns) do
    ~H"""
    <header class="sticky top-0 left-0 z-10 px-4 bg-white sm:px-6 lg:px-8">
      <div class="flex items-center justify-between py-3 border-b border-zinc-100">
        <div class="flex items-center gap-4">
          <a href="/">
            <svg viewBox="0 0 71 48" class="h-6" aria-hidden="true">
              <path
                d="m26.371 33.477-.552-.1c-3.92-.729-6.397-3.1-7.57-6.829-.733-2.324.597-4.035 3.035-4.148 1.995-.092 3.362 1.055 4.57 2.39 1.557 1.72 2.984 3.558 4.514 5.305 2.202 2.515 4.797 4.134 8.347 3.634 3.183-.448 5.958-1.725 8.371-3.828.363-.316.761-.592 1.144-.886l-.241-.284c-2.027.63-4.093.841-6.205.735-3.195-.16-6.24-.828-8.964-2.582-2.486-1.601-4.319-3.746-5.19-6.611-.704-2.315.736-3.934 3.135-3.6.948.133 1.746.56 2.463 1.165.583.493 1.143 1.015 1.738 1.493 2.8 2.25 6.712 2.375 10.265-.068-5.842-.026-9.817-3.24-13.308-7.313-1.366-1.594-2.7-3.216-4.095-4.785-2.698-3.036-5.692-5.71-9.79-6.623C12.8-.623 7.745.14 2.893 2.361 1.926 2.804.997 3.319 0 4.149c.494 0 .763.006 1.032 0 2.446-.064 4.28 1.023 5.602 3.024.962 1.457 1.415 3.104 1.761 4.798.513 2.515.247 5.078.544 7.605.761 6.494 4.08 11.026 10.26 13.346 2.267.852 4.591 1.135 7.172.555ZM10.751 3.852c-.976.246-1.756-.148-2.56-.962 1.377-.343 2.592-.476 3.897-.528-.107.848-.607 1.306-1.336 1.49Zm32.002 37.924c-.085-.626-.62-.901-1.04-1.228-1.857-1.446-4.03-1.958-6.333-2-1.375-.026-2.735-.128-4.031-.61-.595-.22-1.26-.505-1.244-1.272.015-.78.693-1 1.31-1.184.505-.15 1.026-.247 1.6-.382-1.46-.936-2.886-1.065-4.787-.3-2.993 1.202-5.943 1.06-8.926-.017-1.684-.608-3.179-1.563-4.735-2.408l-.043.03a2.96 2.96 0 0 0 .04-.029c-.038-.117-.107-.12-.197-.054l.122.107c1.29 2.115 3.034 3.817 5.004 5.271 3.793 2.8 7.936 4.471 12.784 3.73A66.714 66.714 0 0 1 37 40.877c1.98-.16 3.866.398 5.753.899Zm-9.14-30.345c-.105-.076-.206-.266-.42-.069 1.745 2.36 3.985 4.098 6.683 5.193 4.354 1.767 8.773 2.07 13.293.51 3.51-1.21 6.033-.028 7.343 3.38.19-3.955-2.137-6.837-5.843-7.401-2.084-.318-4.01.373-5.962.94-5.434 1.575-10.485.798-15.094-2.553Zm27.085 15.425c.708.059 1.416.123 2.124.185-1.6-1.405-3.55-1.517-5.523-1.404-3.003.17-5.167 1.903-7.14 3.972-1.739 1.824-3.31 3.87-5.903 4.604.043.078.054.117.066.117.35.005.699.021 1.047.005 3.768-.17 7.317-.965 10.14-3.7.89-.86 1.685-1.817 2.544-2.71.716-.746 1.584-1.159 2.645-1.07Zm-8.753-4.67c-2.812.246-5.254 1.409-7.548 2.943-1.766 1.18-3.654 1.738-5.776 1.37-.374-.066-.75-.114-1.124-.17l-.013.156c.135.07.265.151.405.207.354.14.702.308 1.07.395 4.083.971 7.992.474 11.516-1.803 2.221-1.435 4.521-1.707 7.013-1.336.252.038.503.083.756.107.234.022.479.255.795.003-2.179-1.574-4.526-2.096-7.094-1.872Zm-10.049-9.544c1.475.051 2.943-.142 4.486-1.059-.452.04-.643.04-.827.076-2.126.424-4.033-.04-5.733-1.383-.623-.493-1.257-.974-1.889-1.457-2.503-1.914-5.374-2.555-8.514-2.5.05.154.054.26.108.315 3.417 3.455 7.371 5.836 12.369 6.008Zm24.727 17.731c-2.114-2.097-4.952-2.367-7.578-.537 1.738.078 3.043.632 4.101 1.728.374.388.763.768 1.182 1.106 1.6 1.29 4.311 1.352 5.896.155-1.861-.726-1.861-.726-3.601-2.452Zm-21.058 16.06c-1.858-3.46-4.981-4.24-8.59-4.008a9.667 9.667 0 0 1 2.977 1.39c.84.586 1.547 1.311 2.243 2.055 1.38 1.473 3.534 2.376 4.962 2.07-.656-.412-1.238-.848-1.592-1.507Zm17.29-19.32c0-.023.001-.045.003-.068l-.006.006.006-.006-.036-.004.021.018.012.053Zm-20 14.744a7.61 7.61 0 0 0-.072-.041.127.127 0 0 0 .015.043c.005.008.038 0 .058-.002Zm-.072-.041-.008-.034-.008.01.008-.01-.022-.006.005.026.024.014Z"
                fill="#FD4F00"
              />
            </svg>
          </a>
          <p class="rounded-full bg-brand/5 px-2 text-[0.8125rem] font-medium leading-6 text-brand">
            v1.7
          </p>
        </div>
        <div class="flex items-center gap-4">
          <a
            href="https://twitter.com/elixirphoenix"
            class="text-[0.8125rem] font-semibold leading-6 text-zinc-900 hover:text-zinc-700"
          >
            @elixirphoenix kkkkk
          </a>
          <a
            href="https://github.com/phoenixframework/phoenix"
            class="text-[0.8125rem] font-semibold leading-6 text-zinc-900 hover:text-zinc-700"
          >
            GitHub
          </a>
          <a
            href="https://hexdocs.pm/phoenix/overview.html"
            class="rounded-lg bg-zinc-100 px-2 py-1 text-[0.8125rem] font-semibold leading-6 text-zinc-900 hover:bg-zinc-200/80 active:text-zinc-900/70"
          >
            Get Started <span aria-hidden="true">&rarr;</span>
          </a>
        </div>
      </div>
    </header>
    """
  end

  attr :categories, :list
  attr :conn, :list

  def sidebar(assigns) do
    ~H"""
    <aside class="flex-shrink-0 w-64 pl-8 border-r">
      <div class="flex items-center justify-between mb-8 text-xl"></div>
      <div>
        <span class="mb-4 text-xs text-gray-500">CATEGORY</span>
        <ul>
          <li :for={category <- Enum.sort_by(@categories, & &1.display_name, :asc)}>
            <.link
              href={"/course/category/#{category.url}"}
              class="leading-6 text-gray-700 hover:text-gray-700"
            >
              <div class="flex flex-row items-center justify-between h-10 cursor-pointer hover:text-green-600">
                <span class={"#{if Phoenix.Controller.current_path(@conn) == "/course/category/#{category.url}", do: "text-green-600"} relative  w-full"}>
                  <%!-- <Heroicons.arrow_left solid class="inline w-3 h-3 stroke-current" /> --%>
                  <%= category.display_name %>
                  <span
                    :if={Phoenix.Controller.current_path(@conn) == "/course/category/#{category.url}"}
                    class="absolute top-0 left-0 w-1 h-full -translate-x-4 bg-green-600"
                  >
                  </span>
                </span>
              </div>
            </.link>
            <ul :if={category.subcategory}>
              <li
                :for={subcategory <- Enum.sort_by(category.subcategory, & &1.display_name, :asc)}
                class="flex items-center h-10 text-gray-500 cursor-pointer group"
              >
                <span class="bg-gray-300 w-0.5 h-full group-last:self-start group-last:h-1/2 "></span>
                <span class="w-4 h-0.5 bg-gray-300 "></span>
                <.link href={"/course/category/#{category.url}/subcategory/#{subcategory.url}"}>
                  <span class={"flex items-center w-full h-full ml-4 hover:text-gray-700 #{if Phoenix.Controller.current_path(@conn) == "/course/category/#{category.url}/subcategory/#{subcategory.url}", do: "text-gray-700"}"}>
                    <%= subcategory.display_name %>
                  </span>
                </.link>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </aside>
    """
  end

  attr :course, :map
  slot :inner_block

  def card(assigns) do
    ~H"""
    <div class="h-auto overflow-hidden transition-all duration-300 ease-in-out bg-white rounded-md shadow-lg w-60 max-h-72 hover:scale-105">
      <.link href={"/course/#{@course.url}"} class="flex flex-col h-full cursor-default">
        <div>
          <img src="https://dummyimage.com/250x250/aaa/eee.jpg" alt="" srcset="" />
        </div>
        <div class="flex flex-col h-full p-4 gap-y-2 justify-items-end">
          <div class="flex flex-col flex-1 overflow-hidden">
            <p class="font-semibold truncate">
              <%= @course.display_name %>
            </p>
            <div class="text-sm capitalize opacity-50">
              <%= @course.topic %>
            </div>
          </div>
          <div class="flex items-center justify-between w-full text-gray-500">
            <span class="flex overflow-hidden rounded-lg">
              <span class="px-2 text-sm font-semibold bg-gray-100">
                <icon class="text-base opacity-50 mdi mdi-play-circle"></icon>
                <%= @course.videos %> Videos
              </span>
            </span>
            <span class="flex overflow-hidden rounded-lg">
              <span class="px-2 text-sm font-semibold bg-gray-100">
                <icon class="text-base opacity-50 mdi mdi-timer"></icon>
                <%= @course.hours %> Hours
              </span>
            </span>
          </div>
        </div>
      </.link>
    </div>
    """
  end

  attr :icon, :string
  attr :icon_bg, :string
  attr :icon_color, :string, default: nil
  attr :class, :string
  attr :rounded, :boolean
  slot :inner_block

  def icon(assigns) do
    ~H"""
    <div class={"flex items-center justify-center w-8 h-8 #{@icon_bg} #{if @rounded, do: "rounded-full"} shrink-0"}>
      <span class={"text-lg #{@icon_color} mdi #{@icon}"}></span>
    </div>
    """
  end
end
