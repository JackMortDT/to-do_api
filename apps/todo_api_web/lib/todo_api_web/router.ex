defmodule TodoApiWeb.Router do
  use TodoApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Health Routes
  scope "/", TodoApiWeb do
    get "/health", HealthCheckController, :run_health_checks
  end

  scope "/api", TodoApiWeb do
    pipe_through :api
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:todo_api_web, :dev_routes) do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
