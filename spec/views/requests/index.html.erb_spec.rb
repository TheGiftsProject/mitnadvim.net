require 'spec_helper'

describe "requests/index" do
  before(:each) do
    assign(:requests, [
      stub_model(Request,
        :status => "Status",
        :school_id => 1,
        :name => "Name",
        :description => "MyText",
        :photo_url => "Photo Url",
        :category_id => 2
      ),
      stub_model(Request,
        :status => "Status",
        :school_id => 1,
        :name => "Name",
        :description => "MyText",
        :photo_url => "Photo Url",
        :category_id => 2
      )
    ])
  end

  it "renders a list of requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Photo Url".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
