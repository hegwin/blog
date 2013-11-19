require 'spec_helper'

describe "admin/posts/show" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :title_cn => "Title Cn",
      :title_en => "Title En",
      :body => "MyText",
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title Cn/)
    rendered.should match(/Title En/)
    rendered.should match(/MyText/)
  end
end
