class AddCacheHistories < ActiveRecord::Migration
  def change
    create_table :cache_histories, {id: false} do |t|
      t.string :name, primary_key: true
      t.integer :recache_count, default: 0
      t.integer :write_count, default: 0
      t.datetime :expires_at
      t.timestamps null: false
    end
    execute "ALTER TABLE cache_histories ADD PRIMARY KEY (name);"
  end
end
