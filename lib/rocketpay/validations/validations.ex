defmodule Rocketpay.Validations do
  @spec email_format() :: Regex.t()
  def email_format(), do: ~r/^[A-Za-z0-9\-._%+-+']+@[A-Za-z0-9.-]+\.[A-Za-z]+$/

  @spec phone_format() :: Regex.t()
  def phone_format(), do: ~r/(\(\d{2,}\)|\d{2,})( )?\d{4,}(\-)?\d{4}/
end
