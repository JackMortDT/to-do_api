defmodule TodoApi.Utils.Regex do
  @moduledoc """
  Common regular expressions
  """

  def email_regex do
    ~r/^([a-zA-Z0-9_.!#$%&'*+\-\/=?^_`{|}~]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,20})$/
  end
end
