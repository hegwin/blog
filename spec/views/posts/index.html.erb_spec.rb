require 'rails_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [
      Post.new(
        :title_cn => "Title Cn",
        :title_en => "Title En 1",
        :body => "MyText",
        :slug => "Slug",
        :posted_on => "2012-01-01"
      ),
      Post.new(
        :title_cn => "Title Cn",
        :title_en => "Title En 2",
        :body => "MyText",
        :slug => "Slug",
        :posted_on => "2012-01-01"
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h2>a", :text => "Title Cn".to_s, :count => 2
    assert_select "div.post-body", :text => "MyText".to_s, :count => 2
    # assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
