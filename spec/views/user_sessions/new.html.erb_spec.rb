require "spec_helper"

describe "user_sessions/new.html.erb" do
  it "displays login phrase" do
    render
    expect(rendered).to match /Logowanie/m
  end

  it "displays included form submit button" do
  	render
  	expect(rendered).to match /Zaloguj/m
  end
  it "displays included form email label" do
  	render
  	expect(rendered).to match /email/m
  end
  it "displays included form password label" do
  	render
  	expect(rendered).to match /Hasło/m
  end
end