class CreateOctopartQueryCaches < ActiveRecord::Migration
  def change
    create_table :octopart_query_caches do |t|
      t.string :query_hash , :unique=>true, :null=>false
      t.text :query
      t.text :json_result
      t.integer :http_response

      t.timestamps
    end

    add_index :octopart_query_caches, :query_hash
  end
end
