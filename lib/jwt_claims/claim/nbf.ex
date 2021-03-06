defmodule JwtClaims.Claim.Nbf do
  @moduledoc """
  Not before

  see http://tools.ietf.org/html/rfc7519#section-4.1.5
  """

  alias JwtClaims.Util

  @doc """
  Predicate to reject an expiration time claim value equal to or before the current time

  ## Example
      iex> seconds = Util.time_now - 1
      ...> Nbf.reject?(seconds)
      false

  Returns `true` if the current time is before `numeric_date`; otherwise returns `false`

  `numeric_date` is the number of seconds from the Unix Epoch (1970-01-01T00:00:00Z UTC)
  until the specified UTC date/time; non-integer values may be used
  """
  def reject?(numeric_date, options \\ %{})
  def reject?(numeric_date, options) when is_number(numeric_date) do
    numeric_date > Util.time_now
  end
  def reject?(_, _), do: true
end
