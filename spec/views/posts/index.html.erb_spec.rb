require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :title_cn => "Title Cn",
        :title_en => "Title En",
        :body => "MyText",
        :slug => "Slug"
      ),
      stub_model(Post,
        :title_cn => "Title Cn",
        :title_en => "Title En",
        :body => "MyText",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title Cn".to_s, :count => 2
    assert_select "tr>td", :text => "Title En".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
