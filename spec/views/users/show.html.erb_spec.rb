require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone_number => "Phone Number",
      :type => "Type",
      :facebook_id => "Facebook",
      :school_id => 1,
      :gender => "Gender",
      :age => 2,
      :area_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/Phone Number/)
    rendered.should match(/Type/)
    rendered.should match(/Facebook/)
    rendered.should match(/1/)
    rendered.should match(/Gender/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
