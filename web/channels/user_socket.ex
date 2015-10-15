defmodule Chat.UserSocket do
  use Phoenix.Socket

  channel "rooms:*", Chat.RoomChannel

  transport :websocket, Phoenix.Transports.WebSocket
  transport :longpoll, Phoenix.Transports.LongPoll

  def connect(_params, socket) do
    Phoenix.PubSub.Local.subscribers(Chat.PubSub.Local, "rooms:lobby") 
    |> Enum.count 
    |> IO.inspect
    {:ok, socket}
  end

  def id(_socket), do: nil
end
