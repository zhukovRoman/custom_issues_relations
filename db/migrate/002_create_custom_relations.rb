class CreateCustomRelations < ActiveRecord::Migration
  def change
    create_table :custom_relations do |t|
      t.belongs_to :custom_relation_type
      t.belongs_to :issue
    end

    change_table :custom_relations do |t|
      rename_column :custom_relations, :issue_id, :issue_from_id
      t.belongs_to :issue
    end

    change_table :custom_relations do |t|
      rename_column :custom_relations, :issue_id, :issue_to_id
    end
  end
end
