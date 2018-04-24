class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events, :id => false do |t|
      t.uuid :id, primary_key: true
      t.string :name
      t.string :subdomain
      t.boolean :istemplate
      t.string :interfaceurl

      t.timestamps
    end
  end
end
