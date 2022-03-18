require 'rails_helper'
require 'test_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'Gabriel', email: 'example@mail.com', password: 'password') }
  let(:group) { Group.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png', user_id: user.id) }
  let(:entity) { Entity.create(name: 'Dress', amount: 12, user_id: user.id) }
  let(:entity_group) { EntityGroup.create(group_id: group.id, entity_id: entity.id) }

  describe 'Validations' do
    context 'when valid' do
      it { expect(entity).to be_valid }
    end

    it 'valid entity_group' do
      expect(entity_group).to be_valid
    end

    it 'should valid name ' do
      entity.name = nil
      expect(entity).to_not be_valid
    end
    it 'should valid amount ' do
      entity.amount = -10
      expect(entity).to_not be_valid
    end
    it 'should valid amount ' do
      entity.amount = 10
      expect(entity).to be_valid
    end
  end
end
