class CreateItemsImports < ActiveRecord::Migration[6.0]
  def change
    create_table :items_imports do |t|
      t.string :file_name
      t.string :uploaded_by
      t.datetime :uploaded_at
      t.boolean :status

      t.timestamps
    end
  end
end
