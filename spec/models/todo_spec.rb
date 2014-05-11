require 'spec_helper'

describe Todo do
  it "has no todo in the database" do
    expect(Todo).to have(:no).records
    expect(Todo).to have(0).records
  end

  it "has one record" do
    Todo.create!(:name => "Cog")
    expect(Todo).to have(1).record
  end

  it "counts only records that match a query" do
    Todo.create!(:name => "Cog")
    expect(Todo.where(:name => "Cog")).to have(1).record
    expect(Todo.where(:name => "Wheel")).to have(0).records
  end
  it "has none to begin with" do
    expect(Todo.count).to eq 0
  end

  it "has one after adding one" do
    Todo.create
    expect(Todo.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Todo.count).to eq 0
  end
end
