# require 'rails_helper'

# RSpec.describe "services/new", :type => :view do
#   before(:each) do
#     assign(:service, Service.new(
#       :name => "MyString",
#       :category => "MyString",
#       :website => "MyString",
#       :notes => "MyString",
#       :phone => "MyString",
#       :address => "MyString",
#       :contact => "MyString",
#       :referral => "MyString",
#       :eligibility => "MyString",
#       :insurance => "MyString"
#     ))
#   end

#   it "renders new service form" do
#     render

#     assert_select "form[action=?][method=?]", services_path, "post" do

#       assert_select "input#service_name[name=?]", "service[name]"

#       assert_select "input#service_category[name=?]", "service[category]"

#       assert_select "input#service_website[name=?]", "service[website]"

#       assert_select "input#service_notes[name=?]", "service[notes]"

#       assert_select "input#service_phone[name=?]", "service[phone]"

#       assert_select "input#service_address[name=?]", "service[address]"

#       assert_select "input#service_contact[name=?]", "service[contact]"

#       assert_select "input#service_referral[name=?]", "service[referral]"

#       assert_select "input#service_eligibility[name=?]", "service[eligibility]"

#       assert_select "input#service_insurance[name=?]", "service[insurance]"
#     end
#   end
# end
