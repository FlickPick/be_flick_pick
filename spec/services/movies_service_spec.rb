require 'rails_helper'

describe MoviesService do
  before :each do
    @movie = MoviesService.new
  end

  context 'helper methods' do
    describe '#conn' do
      it 'returns a faraday connection' do
        expect(@movie.conn).to be_a Faraday::Connection
      end
    end

    describe '#get_url' do
      it 'returns a faraday response', :vcr do
        expect(@movie.get_url('/3/movie/36685')).to be_a Faraday::Response
      end
    end
  end

  context 'class methods' do
    describe '#movie' do
      it 'returns a movie details by movie_id', :vcr do
        rhps = @movie.movie(36685)
        pm = @movie.movie(128)

        expect(rhps).to be_a Hash

        expect(rhps).to have_key :title
        expect(rhps[:title]).to be_a(String)

        expect(rhps).to have_key :runtime
        expect(rhps[:runtime]).to be_a(Integer)

        expect(rhps).to have_key :release_date
        expect(rhps[:release_date]).to be_a(String)

        expect(rhps).to have_key :spoken_languages
        expect(rhps[:spoken_languages]).to be_a(Array)

        expect(rhps).to have_key :release_dates
        expect(rhps[:release_dates]).to be_a(Hash)
      end
    end

    describe '#movies_by_services', :vcr do
      it 'returns all movies by a single provider' do
        netflix = @movie.movies_by_services('US', '8')

        expect(netflix).to be_a Hash
        
        expect(netflix).to have_key :results
      end

      it 'returns all movies from multiple providers' do
        netflix = @movie.movies_by_services('US', '8')
        disney = @movie.movies_by_services('US', '337')
        netflix_and_disney = @movie.movies_by_services('US', '8|337')

        expect(netflix_and_disney).to be_a Hash

        expect(netflix_and_disney).to have_key :results

        expect(netflix).to_not eq(disney)
        expect(netflix).to_not eq(netflix_and_disney)
        expect(disney).to_not eq(netflix_and_disney)
        expect(netflix_and_disney[:results].first).to eq(netflix[:results].first).or eq(disney[:results].first)
      end
    end

    describe "#trailers" do 
      it "should return trailers from a movie id", :vcr do 
        trailers = @movie.trailers(550)

        expect(trailers).to be_a(Hash)
        expect(trailers).to have_key :results
        results = trailers[:results]

        expect(results.first).to have_key(:name)
        expect(results.first).to have_key(:key)
      end
    end
  end
end