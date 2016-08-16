class CreateCustomRelationType < ActiveRecord::Migration
  def change
    create_table :custom_relation_types do |t|
      t.string :title
      t.belongs_to :custom_relation_type
      t.integer  :order_index
    end
    change_table :custom_relation_types do |t|
      rename_column :custom_relation_types, :custom_relation_type_id, :reverse_id
    end

  end
end
