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

  describe '#average_rating' do
    it 'should return an average of its comments\' ratings' do
      service = Service.create(name: 'organization')
      expect(service.average_rating).to eq(0)

      comment1 = Comment.create({service: service, rating: 3, text: comment1})
      comment2 = Comment.create({service: service, rating: 4, text: comment2})
      expect(service.average_rating).to eq(3.5)
    end
  end
end
