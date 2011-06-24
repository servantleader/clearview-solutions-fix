class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string    :name
      t.text      :description
      t.string    :attachment
      t.boolean   :private, :default => true
      t.integer   :stage

      t.integer   :folder_id
      t.integer   :investor_id
      t.integer   :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
