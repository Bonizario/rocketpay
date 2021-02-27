defmodule RocketpayWeb.UsersView do
  @created_fields [:id, :nickname, :name]

  def render("create.json", %{user: user}) do
    %{
      message: "User created",
      user: Map.take(user, @created_fields)
    }
  end
end
