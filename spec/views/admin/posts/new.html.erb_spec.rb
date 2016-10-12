require 'rails_helper'

describe "admin/posts/new" do
  before(:each) do
    @post = assign(:post, build(:post,
      title_cn: "Title Cn",
      title_en: "Title En",
      body: "MyText"
    ))
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_posts_path, "post" do
      assert_select "input#post_title_cn[name=?]", "post[title_cn]"
      assert_select "input#post_title_en[name=?]", "post[title_en]"
      assert_select "textarea#post_body[name=?]", "post[body]"
    end
  end
end
