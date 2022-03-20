class Group < ApplicationRecord
  belongs_to :user
  has_many :entity_groups, dependent: :destroy
  has_many :entities, through: :entity_groups, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
end
