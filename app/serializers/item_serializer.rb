class ItemSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :todo

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
