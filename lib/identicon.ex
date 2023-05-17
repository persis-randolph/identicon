# REQUIREMENTS
# 300px by 300px, 5x5 grid with squares, each 50px tall and wide, must be mirrored on the y-axis
# Each one should not be randomly generated, should be generated via a provided string, ie. "billy" should always generate the same thing, "jane" should always generate the same thing (unique repeatable token)
# string -> compute MD5 hash of string -> list of numbers based on the string -> pick color -> build grid of squares -> convert grid into image -> save image

defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """
    Takes a string and converts it into a unique, repeatable Identicon.

  ## Examples

      iex> Identicon.main("banana")
      %Identicon.Image{
        hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65]
      }

  """
  def main(input) do
    input
    |> hash_input
  end

  @doc """
    Takes a string input, converts it to a MD5 hash, and returns it as a hex image.

  ## Examples

      iex> Identicon.hash_input("banana")
      %Identicon.Image{
        hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65]
      }

  """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
