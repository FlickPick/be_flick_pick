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

  ### US watch_region == US
  ### Netflix watch_provider == 8
  ### Disney+ watch_provider == 337

  # refactor this method to be our catch-all for party filtering
  def movies_by_services(watch_region, watch_providers, genres = nil, max_rating = nil, max_runtime = nil)
    # require 'pry';binding.pry
    json_parse(
      # refactor this url to have more default queries
      conn.get('/3/discover/movie') do |req|
        req.params['sort_by'] = 'popularity.desc'
        req.params['watch_region'] = watch_region
        req.params['with_watch_providers'] = watch_providers
        # req.params['with_runtime.lte'] = max_runtime if max_runtime
      end
    )
  end

  def trailers(id)
    json_parse(
      conn.get("/3/movie/#{id}/videos"))
  end

  # What we need from the API
    # Movie rating (#movie)
    # Movie runtime (#movie)
    # Movie year released (#movie)
    # Movie language (#movie)
    # Movie title (#movie)
    # Movie poster (#movie)
    # Movie services (#movies_by_services)
end