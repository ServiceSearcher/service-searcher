require 'rails_helper'

RSpec.describe Comment, :type => :model do

  it 'should belong to a resource' do
    expect(subject).to belong_to(:service)
  end

end
