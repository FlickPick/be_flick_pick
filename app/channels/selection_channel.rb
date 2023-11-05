class SelectionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "selection_channel"
  end

  def unsubscribed

  end

  def select_movie(movie)
    if all_users_selected_same_movie?
      ActionCable.server.broadcast("selection_channel", message: "#{selected_movie} has been selected!", link: '/link-to-selected-movie')
    end
  end
  
  def all_users_selected_same_movie?
    # some code that shows all users selected the same movie
  end
  
    def selected_movie
      # some code that returns the name of the selected movie
    end
end