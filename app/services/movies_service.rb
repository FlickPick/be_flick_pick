class MoviesService < ApplicationService

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:key]
    end
  end

  def get_url(url)
    conn.get(url)
  end

  ### Rocky Horror - 36685
  ### Princess Mononoke - 128

  def movie(id)
    json_parse(
      conn.get("/3/movie/#{id}") do |req|
        req.params['append_to_response'] = 'release_dates'
      end
    )
  end

  def cast(id)
    json_parse(get_url("/3/movie/#{id}/credits"))[:cast][0..9]
  end

  def movies_by_round(party_id, round)
    party = Party.find(party_id)
    json_parse(
      conn.get('/3/discover/movie?certification_country=US&include_adult=false&include_video=false&language=en-US&sort_by=popularity.desc&watch_region=US') do |req|
        req.params['with_watch_providers'] = party.services if party.services
        req.params['genres'] = party.genres if party.genres
        req.params['certification.lte'] = party.max_rating if party.max_rating
        req.params['with_runtime.lte'] = party.max_runtime if party.max_runtime
        req.params['page'] = round if round
      end
    )
  end

  def trailers(id)
    json_parse(
      get_url("/3/movie/#{id}/videos")
    )
  end

  # What we need from the API
    # Movie rating (#movie)
    # Movie runtime (#movie)
    # Movie year released (#movie)
    # Movie language (#movie)
    # Movie title (#movie)
    # Movie poster (#movie)
    # Movie services (#movies_by_round)
end