require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:subject) { described_class.new(params) }
  let(:state) { 0 }
  let(:user1) { User.create!(
    name: "David",
    email: "test@test.com",
    password: "123456"
  ) }

  let(:user2) { User.create!(
    name: "David2",
    email: "test2@test2.com",
    password: "123456"
  ) }

  let(:params) {
    {
      title: "nice title",
      body: "Complementing the title",
      user: user1,
      state: state
    }
  }

  describe '#delete!' do
    before :each do
      subject.save!
    end

    context 'when current_user is the creator of the post' do
      it 'change the state to deleted' do
        expect{subject.delete!(user1)}.to change{Post.deleted.count}.by(1)
      end
    end

    context 'when current_user is not the creator of the post' do
      it 'raise error' do
        expect{subject.delete!(user2)}.to raise_error
      end
    end
  end

  describe 'params' do
    context 'with wrong state' do
      let(:state) {3}

      it 'return false' do
        expect{ subject.save! }.to raise_error(ArgumentError)
      end
    end
  end
end
