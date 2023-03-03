defmodule ScholarrWeb.AppComponents do
  use ScholarrWeb, :html

  def navbar(assigns) do
    ~H"""
    <header class="sticky top-0 left-0 z-10 px-4 bg-white sm:px-6 lg:px-8">
      <div class="flex items-center justify-between py-3 border-b border-zinc-100">
        <div class="flex items-center gap-4">
          Scholarr
          <p class="rounded-full bg-brand/5 px-2 text-[0.8125rem] font-medium leading-6 text-brand">
            v0.1
          </p>
        </div>
        <div class="flex items-center gap-4">
          <a
            href="https://twitter.com/elixirphoenix"
            class="text-[0.8125rem] font-semibold leading-6 text-zinc-900 hover:text-zinc-700"
          >
            @elixirphoenix
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
