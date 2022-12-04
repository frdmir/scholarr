defmodule Scholarr.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ScholarrWeb.Telemetry,
      # Start the Ecto repository
      Scholarr.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Scholarr.PubSub},
      # Start Finch
      {Finch, name: Scholarr.Finch},
      # Start the Endpoint (http/https)
      ScholarrWeb.Endpoint
      # Start a worker by calling: Scholarr.Worker.start_link(arg)
      # {Scholarr.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Scholarr.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ScholarrWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
