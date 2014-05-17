require "spec_helper"

describe "users/new.html.erb" do
  it "displays registration phrase" do
    assign(:user, User.new)
    render
    expect(rendered).to match /Rejestracja/m
  end
  it "displays included form email label" do
    assign(:user, User.new)
  	render
  	expect(rendered).to match /email/m
  end
  it "displays included form password label" do
    assign(:user, User.new)
  	render
  	expect(rendered).to match /Hasło/m
  end
end