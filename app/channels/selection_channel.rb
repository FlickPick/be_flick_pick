class SelectionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "selection_channel_#{params['party']}"
  end

  def update_results
    # Rails.logger.info "Data received: #{data.inspect}, Class: #{data.class}"
    # Explicitly structure the broadcast data
    # require 'pry';binding.pry

    liked_movies = LikedMovie.joins(:temp_user).where('temp_users.party_id': params['party'])
    
    liked_movies_results = liked_movies.map do |movie|
      movie_id = movie.movie_id
    end.tally

    most_liked_votes = liked_movies_results.values.max

    if most_liked_votes == TempUser.where(party_id: params['party']).count
      most_liked_movie_id = liked_movies_results.max_by {|movie, votes| votes }[0]

      Party.find(params['party']).update(movie_id: most_liked_movie_id)

      most_liked_movie_name = MoviesService.new.movie(most_liked_movie_id)[:title]

      broadcast_data = {results: ["#{most_liked_movie_name} has been selected!", "Please proceed to Movie Details!"]}
    else
      liked_movie_titles = liked_movies_results.map do |movie_id, count|
        title = MoviesService.new.movie(movie_id)[:title]
        title
      end.tally
      
      sorted_liked_movies = liked_movie_titles.sort do |(movie1, count1), (movie2, count2)|
        if count1 == count2
          movie1 <=> movie2
        else
          count2 <=> count1
        end
      end
  
      formatted_liked_movies = sorted_liked_movies.map {|movie, count| "#{movie}: #{count} Vote(s)"}
  
      broadcast_data = { results: formatted_liked_movies }
    end


    # figure out how to get party code in here...
    ActionCable.server.broadcast("selection_channel_#{params['party']}", broadcast_data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end


  def recieve(data)
    party = Party.find(params[:party_id])
    liked_movies = party.liked_movies    
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