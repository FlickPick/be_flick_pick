class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_channel'
  end

  def send_message
    # Rails.logger.info "Data received: #{data.inspect}, Class: #{data.class}"
    # Explicitly structure the broadcast data
    # require 'pry';binding.pry

    party_users = all_users.map do |user|
      user[:name]
    end
    # require 'pry';binding.pry
    broadcast_data = { message: party_users }
    ActionCable.server.broadcast('chat_channel', broadcast_data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def all_users
    TempUser.where(party_id: params["room"])
  end
end
