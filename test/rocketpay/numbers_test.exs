defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "returns the sum of numbers from a file when given a valid filename" do
      response = Numbers.sum_from_file("numbers")
      expected_response = {:ok, %{result: 37}}
      assert response == expected_response
    end

    test "returns an error when given an invalid filename" do
      response = Numbers.sum_from_file("invalid_filename")
      expected_response = {:error, %{message: "Invalid file!"}}
      assert response == expected_response
    end
  end
end
