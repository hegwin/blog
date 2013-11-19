require 'spec_helper'

describe "sessions/new" do
  it "renders login form" do
    render

    assert_select "form[action=?][method=?]", login_path, "post" do
      assert_select "input#name"
      assert_select "input#password"
    end
  end
end
