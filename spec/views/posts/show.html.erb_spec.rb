require 'rails_helper'

describe "posts/show" do
  before(:each) do
    @post = assign(:post, double(Post,
      :title_cn => "Title Cn",
      :title_en => "Title En",
      :body => "MyText",
      :slug => "Slug",
      :posted_on => "2010-01-01".to_date
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Title Cn/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match("2010-01-01")
  end
end
