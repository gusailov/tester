class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.references :question, foreign_key: true
      t.string :gist_url
      t.string :user

      t.timestamps
    end
  end
end
