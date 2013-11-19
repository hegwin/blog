require 'spec_helper'

describe "static_page/about" do
  it "render the about page" do
    render

    assert_select "h2", "About Hegwin and His Dream"
  end
end
