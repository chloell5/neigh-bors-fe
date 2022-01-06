class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :password
      t.integer :phone
      t.integer :horses
      t.boolean :needs
      t.string :needs_text
      t.string :trailer
      t.boolean :sharing

      t.timestamps
    end
  end
end
