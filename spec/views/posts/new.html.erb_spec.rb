require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post,
      :title_cn => "MyString",
      :title_en => "MyString",
      :body => "MyText",
      :slug => "MyString"
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "input#post_title_cn[name=?]", "post[title_cn]"
      assert_select "input#post_title_en[name=?]", "post[title_en]"
      assert_select "textarea#post_body[name=?]", "post[body]"
      assert_select "input#post_slug[name=?]", "post[slug]"
    end
  end
end
