require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe PostsHelper do
  describe "#degreade_head" do
    it "should degrade the header level in html" do
      html = %q[
        <html>
          <head><title></title></head>
          <body>
            <h1>Header 1</h1>
            <h2>Header 2</h2>
            <h3>Header 3</h3>
            <h4>Header 4</h4>
          </body>
        </html>
      ]
      expected_html = %q[
        <html>
          <head><title></title></head>
          <body>
            <h3>Header 1</h3>
            <h4>Header 2</h4>
            <h5>Header 3</h5>
            <h6>Header 4</h6>
          </body>
        </html>
      ]
      helper.degrade_head(html, 2).should eq expected_html
    end
  end
end
