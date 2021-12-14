class AnxietySerializer < ActiveModel::Serializer
  attributes :id, :life_theme, :intrusive_thought_or_feeling, :anxiety_theme, :opposite_action, :timer, :progress, :user_id
end
