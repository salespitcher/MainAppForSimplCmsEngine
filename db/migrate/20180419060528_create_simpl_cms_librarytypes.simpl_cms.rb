# This migration comes from simpl_cms (originally 20180418081242)
class CreateSimplCmsLibrarytypes < ActiveRecord::Migration
  def change
    create_table :simpl_cms_librarytypes, :id => false  do |t|
      t.uuid :id, :primary_key => true
      t.string :name

      t.timestamps
    end
  end
end
