require "spec_helper"

describe "todos/index.html.erb" do
  it "displays my todo list in header h1" do
    assign(:todos, Todo.paginate(:page => 1, :per_page => 12))
    render
    expect(rendered).to match /<h1>Moja lista rzeczy do zrobienia<\/h1>/m
  end
  it "displays no todos" do
    assign(:todos, Todo.paginate(:page => 1, :per_page => 12))
    render
    rendered.should_not include "class='item'"
  end
  it "uses infinite scroll" do
    assign(:todos, Todo.paginate(:page => 1, :per_page => 12))
    render
    expect(rendered).to match /.infinitescroll/m
  end
end 