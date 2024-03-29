require "rails_helper"

RSpec.describe Movie do
  before :each do
    attributes = {
      runtime: "106",
      year_released: "1998-05-23",
      original_language: "Japanese",
      title: "Kiki's Delivery Service",
      poster_path: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/Aufa4YdZIv4AXpR9rznwVA5SEfd.jpg",
      genres: ["Animation, Family, Fantasy, Adventure"],
      overview: "A young witch, on her mandatory year of independent life, finds fitting into a new community difficult while she supports herself by running an air courier service.",
      release_dates: {
        results: [
          {
            iso_3166_1: "US",
            release_dates: [
              {
                certification: "G",
                note: "Miyazaki"
              }
            ]
          }
        ]
      }
    }
    
    @movie = Movie.new(attributes)
  end
  
  it "exists and has readable attributes" do
    expect(@movie).to be_a Movie
  end

  it "has readable attributes" do 
    expect(@movie.runtime).to eq("106")
   # expect(@movie.year_released).to eq("1998")
    expect(@movie.title).to eq("Kiki's Delivery Service")
    expect(@movie.poster_path).to eq("https://www.themoviedb.org/t/p/w600_and_h900_bestv2/Aufa4YdZIv4AXpR9rznwVA5SEfd.jpg")
    expect(@movie.genres).to eq(["Animation, Family, Fantasy, Adventure"])
    expect(@movie.rating).to eq("G")
   #expect(@movie.overview).to eq("A young witch, on her mandatory year of independent life, finds fitting into a new community difficult while she supports herself by running an air courier service.")
  end
end