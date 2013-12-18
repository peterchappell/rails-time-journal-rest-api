class EntrySerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :activity_id, :score, :hours, :date
  has_one :activity
end