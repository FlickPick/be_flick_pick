class ChatChannel < ApplicationCable::Channel
  def subscribed
    # require 'pry';binding.pry
    stream_from "chat_channel_#{params['room']}"
  end

  def send_message
    # Rails.logger.info "Data received: #{data.inspect}, Class: #{data.class}"
    # Explicitly structure the broadcast data
    # require 'pry';binding.pry

    party_users = all_users.map do |user|
      user[:name]
    end
    # require 'pry';binding.pry
    broadcast_data = { users: party_users }
    # figure out how to get party code in here...
    ActionCable.server.broadcast("chat_channel_#{params['room']}", broadcast_data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def all_users
    TempUser.where(party_id: params["room"])
  end
end
