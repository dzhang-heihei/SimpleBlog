require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:subject) { described_class.new(params) }
  let(:user1) { User.create!(
    name: "David",
    email: "test@test.com",
    password: "123456"
  )}

  let(:user2) { User.create!(
    name: "David2",
    email: "test2@test2.com",
    password: "123456"
  )}

  let(:post) { Post.create!(
    title: "a title",
    body: "post body",
    user: user1
  )}

  let(:params) {
    {
      body: "Complementing the title",
      user: user1,
      post: post
    }
  }

  describe '#delete!' do
    before :each do
      subject.save!
    end

    context 'when current_user is the creator of the comment' do
      it 'can delete the comment' do
        expect{subject.delete!(user1)}.to change{Comment.count}.by(-1)
      end
    end

    context 'when current_user is not the creator of the comment' do
      it 'raise error' do
        expect{subject.delete!(user2)}.to raise_error
      end
    end
  end
end
