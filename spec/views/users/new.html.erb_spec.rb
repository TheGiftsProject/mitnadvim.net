require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone_number => "MyString",
      :type => "",
      :facebook_id => "MyString",
      :school_id => 1,
      :gender => "MyString",
      :age => 1,
      :area_id => 1
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_first_name", :name => "user[first_name]"
      assert_select "input#user_last_name", :name => "user[last_name]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_phone_number", :name => "user[phone_number]"
      assert_select "input#user_type", :name => "user[type]"
      assert_select "input#user_facebook_id", :name => "user[facebook_id]"
      assert_select "input#user_school_id", :name => "user[school_id]"
      assert_select "input#user_gender", :name => "user[gender]"
      assert_select "input#user_age", :name => "user[age]"
      assert_select "input#user_area_id", :name => "user[area_id]"
    end
  end
end
