defmodule TodoApiWeb.HealthCheckControllerTest do
  use TodoApiWeb.ConnCase

  import Mock

  describe "run_health_checks/2" do
    test "returns 200 OK when services are healthy", %{conn: conn} do
      conn = get(conn, "/health")

      assert response(conn, 200) == "OK"
    end

    test "raises an error when postgres db is down", %{conn: conn} do
      with_mock TodoApi.Repo, query: fn _query -> {:error, "error_response"} end do
        assert_raise RuntimeError, "postgres health check failed for Elixir.TodoApi.Repo", fn ->
          get(conn, "/health")
        end
      end
    end
  end
end
