class CustomRelation < ActiveRecord::Base
  # unloadable
  belongs_to :custom_relation_type
  belongs_to :issue_from, class_name: 'Issue', foreign_key: :issue_from_id
  belongs_to :issue_to, class_name: 'Issue', foreign_key: :issue_to_id

  delegate :title, to: :custom_relation_type, prefix: true, allow_nil: true

  validates :custom_relation_type_id, presence: true
  validates :issue_from_id, presence: true
  validates :issue_to_id, presence: true

  def create_revers_relation
    relation = CustomRelation.create(issue_from_id: issue_to_id, issue_to_id: issue_from_id, custom_relation_type_id: custom_relation_type.reverse_id)
    # relation.save
  end
end
