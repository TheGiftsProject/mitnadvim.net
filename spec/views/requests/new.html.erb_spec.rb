require 'spec_helper'

describe "requests/new" do
  before(:each) do
    assign(:request, stub_model(Request,
      :status => "MyString",
      :school_id => 1,
      :name => "MyString",
      :description => "MyText",
      :photo_url => "MyString",
      :category_id => 1
    ).as_new_record)
  end

  it "renders new request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => requests_path, :method => "post" do
      assert_select "input#request_status", :name => "request[status]"
      assert_select "input#request_school_id", :name => "request[school_id]"
      assert_select "input#request_name", :name => "request[name]"
      assert_select "textarea#request_description", :name => "request[description]"
      assert_select "input#request_photo_url", :name => "request[photo_url]"
      assert_select "input#request_category_id", :name => "request[category_id]"
    end
  end
end
