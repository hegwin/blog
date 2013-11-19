require 'spec_helper'

describe "admin/posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :title_cn => "Title Cn",
        :title_en => "Title En",
        :body => "MyText",
        :slug => "Slug",
        :posted_on => "2012-01-01"
      ),
      stub_model(Post,
        :title_cn => "Title Cn",
        :title_en => "Title En",
        :body => "MyText",
        :slug => "Slug",
        :posted_on => "2012-01-01"
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td>a", :text => "Title Cn".to_s, :count => 2
    assert_select "tr>td", :text => "2012-01-01".to_s, :count => 2
  end
end
