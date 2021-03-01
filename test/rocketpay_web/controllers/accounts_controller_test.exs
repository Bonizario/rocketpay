defmodule RocketpayWeb.AccountsControllerTest do
  use RocketpayWeb.ConnCase, async: true

  alias Rocketpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Gabriel",
        password: "12345678",
        nickname: "bonizario",
        email: "gabriel@gmail.com",
        age: 19
      }

      {:ok, %User{account: %Account{id: account_id}}} = Rocketpay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic cm9vdDowMDAw")

      {:ok, conn: conn, account_id: account_id}
    end

    test "make a deposit when given valid params", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
               "account" => %{
                 "balance" => "50.00",
                 "id" => ^account_id
               },
               "message" => "Balance changed successfully"
             } = response
    end

    test "returns errors when given an invalid value", %{conn: conn, account_id: account_id} do
      params = %{"value" => "invalid_value"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"errors" => "Invalid deposit value!"}

      assert response == expected_response
    end
  end
end
