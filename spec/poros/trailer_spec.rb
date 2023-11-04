require "rails_helper"

RSpec.describe Trailer do 
  it "exists" do 
    attributes = {
      name: "Official Trailer", 
      key: "dfeUzm6KF4g"
    }

    trailer = Trailer.new(attributes)

    expect(trailer.name).to eq("Official Trailer")
    expect(trailer.key).to eq("dfeUzm6KF4g")
  end
end