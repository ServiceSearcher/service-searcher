require 'rails_helper'

RSpec.describe Service, :type => :model do

  it 'should validate presence of name' do
    expect(subject).to validate_presence_of('name')
  end

  it 'should have many comments' do
    expect(subject).to have_many(:comments)
  end

  it 'should destroy its child comments' do
    service = Service.create(name: 'organization')
    comment = Comment.create({rating: 2, text: 'comments on the service', service: service})

    expect(service.comments).to include(comment)

    service.destroy
    expect(Comment.all).to_not include(comment)
  end

end
