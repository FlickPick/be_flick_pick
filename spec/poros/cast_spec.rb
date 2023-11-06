require "rails_helper"

RSpec.describe Cast do
  it "exists" do
    attributes = {
      character: "The Narrator",
      name: "Edward Norton"
    }

    cast_data = Cast.new(attributes)

    expect(cast_data).to be_a(Cast)
    expect(cast_data.character).to eq("The Narrator")
    expect(cast_data.name).to eq("Edward Norton")
  end
end