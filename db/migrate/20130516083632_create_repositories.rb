class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :user
      t.string :login
      t.string :password

      t.timestamps
    end
  end
end
