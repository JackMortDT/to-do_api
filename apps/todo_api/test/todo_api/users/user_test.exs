defmodule TodoApi.Users.UserTest do
  use ExUnit.Case

  alias TodoApi.Users.User

  describe "changeset/2" do
    test "return valid changeset with valid params" do
      params = %{
        username: Faker.Internet.user_name(),
        email: Faker.Internet.email(),
        first_name: Faker.Person.first_name(),
        last_name: Faker.Person.last_name()
      }

      %Ecto.Changeset{} = changeset = User.changeset(%User{}, params)

      assert changeset.valid?
    end

    test "fails if not given required fields" do
      params = %{
        first_name: Faker.Person.first_name(),
        email: Faker.Internet.email()
      }

      %Ecto.Changeset{} = changeset = User.changeset(%User{}, params)

      error = {:username, {"can't be blank", [validation: :required]}}
      assert error in changeset.errors

      refute changeset.valid?
    end

    test "fails when email has incorrect format" do
      params = %{
        email: "wrong_email",
        username: Faker.Internet.user_name()
      }

      %Ecto.Changeset{} = changeset = User.changeset(%User{}, params)

      error = {:email, {"has invalid format", [validation: :format]}}

      assert error in changeset.errors

      refute changeset.valid?
    end
  end
end
