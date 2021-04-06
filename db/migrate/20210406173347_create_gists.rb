class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.string :question, limit: 25
      t.string :gist_url
      t.string :user

      t.timestamps
    end
  end
end
