class CreateContactos < ActiveRecord::Migration[5.2]
  def change
    create_table :contactos do |t|
      t.string :nome, limit: 150
      t.string :email, limit: 150
      t.string :observacao

      t.timestamps
    end
  end
end
