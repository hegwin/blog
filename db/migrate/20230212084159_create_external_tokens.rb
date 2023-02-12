class CreateExternalTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :external_tokens do |t|
      t.string :key, index: true
      t.jsonb :value, default: {}

      t.timestamps
    end
  end
end
