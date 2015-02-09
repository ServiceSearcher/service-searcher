require 'rails_helper'

RSpec.describe "services/index", :type => :view do
  before(:each) do
    assign(:services, [
      Service.create!(
        :name => "Name",
        :category => "Category",
        :website => "Website",
        :notes => "Notes",
        :phone => "Phone",
        :address => "Address",
        :contact => "Contact",
        :referral => "Referral",
        :eligibility => "Eligibility",
        :insurance => "Insurance"
      ),
      Service.create!(
        :name => "Name",
        :category => "Category",
        :website => "Website",
        :notes => "Notes",
        :phone => "Phone",
        :address => "Address",
        :contact => "Contact",
        :referral => "Referral",
        :eligibility => "Eligibility",
        :insurance => "Insurance"
      )
    ])
  end

  it "renders a list of services" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Referral".to_s, :count => 2
    assert_select "tr>td", :text => "Eligibility".to_s, :count => 2
    assert_select "tr>td", :text => "Insurance".to_s, :count => 2
  end
end
