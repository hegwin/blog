require 'spec_helper'

describe "admin/posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :title_cn => "MyString",
      :title_en => "MyString",
      :body => "MyText",
      :slug => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_post_path(@post), "post" do
      assert_select "input#post_title_cn[name=?]", "post[title_cn]"
      assert_select "input#post_title_en[name=?]", "post[title_en]"
      assert_select "textarea#post_body[name=?]", "post[body]"
    end
  end
end
