require 'rails_helper'

describe "admin/posts/index" do
  before(:each) do
    assign(:posts, [ 
      create(:post,
        :title_cn => "Title Cn",
        :title_en => "Title En 1",
        :body => "MyText",
        :posted_on => Time.new(2012, 1, 1, 12)
      ),
      create(:post,
        :title_cn => "Title Cn",
        :title_en => "Title En 2",
        :body => "MyText",
        :posted_on => Time.new(2012, 1, 1, 12)
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
