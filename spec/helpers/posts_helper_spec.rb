require 'rails_helper'

RSpec.describe PostsHelper, type: :helper do
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
      expect(helper.degrade_head(html, 2)).to eq expected_html
    end
  end
end
