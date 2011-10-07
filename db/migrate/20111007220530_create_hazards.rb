class CreateHazards < ActiveRecord::Migration

  def self.up
    create_table :hazards do |t|
      t.string :title
      t.string :category
      t.text :content
      t.integer :position

      t.timestamps
    end

    add_index :hazards, :id

    load(Rails.root.join('db', 'seeds', 'hazards.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "hazards"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/hazards"})
    end

    drop_table :hazards
  end

end
