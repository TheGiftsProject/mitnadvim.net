require 'spec_helper'

describe "schools/edit" do
  before(:each) do
    @school = assign(:school, stub_model(School,
      :name => "MyString",
      :description => "MyText",
      :photo_url => "MyString",
      :area_id => 1
    ))
  end

  it "renders the edit school form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => schools_path(@school), :method => "post" do
      assert_select "input#school_name", :name => "school[name]"
      assert_select "textarea#school_description", :name => "school[description]"
      assert_select "input#school_photo_url", :name => "school[photo_url]"
      assert_select "input#school_area_id", :name => "school[area_id]"
    end
  end
end
