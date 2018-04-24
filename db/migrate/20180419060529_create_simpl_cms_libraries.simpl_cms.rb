# This migration comes from simpl_cms (originally 20180418090331)
class CreateSimplCmsLibraries < ActiveRecord::Migration
  def change
    create_table :simpl_cms_libraries, :id => false do |t|
      t.uuid :id, :primary_key => true
      t.string :name
      t.string :tagname
      t.string :url
      t.text :content
      t.uuid :librarytype_id
      t.integer :position
      t.boolean :forapp
      t.boolean :foronline
      t.uuid :project_id
      t.uuid :origin_id

      t.timestamps
    end

    add_index :simpl_cms_libraries, :librarytype_id
    add_index :simpl_cms_libraries, :project_id
    add_index :simpl_cms_libraries, :origin_id
  end
end
