require 'rails_helper'

RSpec.describe "services/show", :type => :view do
  before(:each) do
    @service = assign(:service, Service.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Notes/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Referral/)
    expect(rendered).to match(/Eligibility/)
    expect(rendered).to match(/Insurance/)
  end
end
