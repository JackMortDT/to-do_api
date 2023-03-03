defmodule TodoApiWeb.HealthCheckController do
  @moduledoc """
  Health check endpoint

  Run a simple query into the database
  """

  use TodoApiWeb, :controller
  alias TodoApi.Repo

  @pg_check_query "SELECT 1"

  action_fallback TodoApiWeb.FallbackController

  def run_health_checks(conn, _params) do
    _ = check_pg_health()

    conn
    |> send_resp(200, "OK")
    |> halt()
  end

  defp check_pg_health do
    case Repo.query(@pg_check_query) do
      {:ok, _result} -> :ok
      _ -> raise "postgres health check failed for #{to_string(Repo)}"
    end
  end
end
