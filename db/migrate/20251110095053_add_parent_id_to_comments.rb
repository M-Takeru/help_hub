class AddParentIdToComments < ActiveRecord::Migration[8.0]
  def change
    remove_index :comments, column: [:commentable_type, :commentable_id]
    remove_column :comments, :commentable_type, :string
    remove_column :comments, :commentable_id, :integer

    add_column :comments, :parent_id, :integer
    add_index :comments, :parent_id

  end
end
