class CreateBiciUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :bici_usuarios do |t|
      t.string :username
      t.string :name
      t.string :document
      t.string :email
      t.string :photo_route
      t.string :password_digest
      t.string :telephone

      t.timestamps
    end
  end
end
