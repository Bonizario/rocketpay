defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User

  describe "call/1" do
    test "returns a new user when given valid params" do
      params = %{
        name: "Gabriel",
        password: "12345678",
        nickname: "bonizario",
        email: "gabriel@gmail.com",
        age: 19
      }

      {:ok, %User{id: user_id}} = Rocketpay.create_user(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Gabriel", age: 19, id: ^user_id} = user
    end

    test "returns errors when given invalid params" do
      params = %{
        name: "Gabriel",
        nickname: "bonizario",
        email: "gabriel@gmail.com",
        age: 15
      }

      {:error, changeset} = Rocketpay.create_user(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
