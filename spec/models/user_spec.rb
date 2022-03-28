require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) { described_class.new(params) }
  let(:name) { "funny name" }
  let(:email) { "test@test.com" }
  let(:password) { "123" }
  let(:params) {
    {
      name: name,
      email: email,
      password: password
    }
  }
  
  describe 'validation presence' do 
    context 'when name is empty' do
      let(:name) { "" }
      it 'raises error' do
        expect{ subject.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
    context 'when email is empty' do
      let(:email) { "" }
      it 'raises error' do
        expect{ subject.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
