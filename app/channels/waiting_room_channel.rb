class WaitingRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "party_#{params[:party_id]}"
  end

  def update_users(data)
    broadcast_data = { user: data['user'] }
    ActionCable.subscribed.broadcast("waiting_room_channel_#{params[party_id]}", broadcast_data)
  end
end