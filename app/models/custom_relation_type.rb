class CustomRelationType < ActiveRecord::Base
  belongs_to :revers_relation_type, class_name: 'CustomRelationType', foreign_key: :reverse_id

  delegate :title, to: :revers_relation_type, prefix: true, allow_nil: true

  validates :title, presence: true

  def has_reverse_relation?
    reverse_id.present?
  end

  def revers_type_id
    reverse_id
  end
end
