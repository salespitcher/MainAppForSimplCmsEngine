# This migration comes from simpl_cms (originally 20180404131034)
class CreateSimplCmsProjects < ActiveRecord::Migration
  def change
    create_table :simpl_cms_projects, id: false do |t|
      t.uuid :id, primary_key: true
      t.string :name, null: false
      t.string :subdomain, null: false

      t.timestamps
    end

    add_index :simpl_cms_projects, :name
    add_index :simpl_cms_projects, :subdomain
  end
end
