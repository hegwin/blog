require 'rails_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [ 
      create(:post,
        :title_cn => "Title Cn",
        :title_en => "Title En 1",
        :body => "MyText",
      ),
      create(:post,
        :title_cn => "Title Cn",
        :title_en => "Title En 2",
        :body => "MyText",
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h2>a", :text => "Title Cn".to_s, :count => 2
    assert_select "div.post-body", :text => "MyText".to_s, :count => 2
  end
end
