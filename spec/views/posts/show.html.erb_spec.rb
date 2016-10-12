require 'rails_helper'

describe "posts/show" do
  before(:each) do
    @post = assign(:post, create(:post,
      title_cn: "Title Cn",
      title_en: "Title En",
      body: "MyText",
      posted_on: Time.new(2010, 1, 1, 12)
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
