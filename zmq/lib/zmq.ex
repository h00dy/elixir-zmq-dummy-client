defmodule Zmq do
  @moduledoc """
  Documentation for Zmq
  """
  require Logger

  def listen(socket) do
    resp = :chumak.recv(socket)
    {:ok, body} = resp
    data = Poison.decode!(body)
    Logger.info data["uuid"]
    listen(socket)
  end

  def connect do
    {:ok, socket} = :chumak.socket(:pull)
    port = System.get_env("PORT") |> String.to_integer
    :chumak.connect(socket, :tcp, '127.0.0.1', port)
    socket
  end
end
