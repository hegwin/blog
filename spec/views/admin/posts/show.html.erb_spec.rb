require 'rails_helper'

describe "admin/posts/show" do
  before(:each) do
    @post = assign(:post, Post.create(
      :title_cn => "Title Cn",
      :title_en => "Title En",
      :body => "MyText",
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Title Cn/)
    expect(rendered).to match(/Title En/)
    expect(rendered).to match(/MyText/)
  end
end
