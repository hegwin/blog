require 'spec_helper'

describe "posts/show" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :title_cn => "Title Cn",
      :title_en => "Title En",
      :body => "MyText",
      :slug => "Slug",
      :posted_on => "2010-01-01"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title Cn/)
    rendered.should match(/MyText/)
    rendered.should match("2010-01-01")
  end
end
