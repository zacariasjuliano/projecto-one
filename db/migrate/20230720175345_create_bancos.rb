class CreateBancos < ActiveRecord::Migration[5.2]
  def change
    create_table :bancos do |t|
      t.string :nome, limit: 200
      t.string :sigla, limit: 10
      t.string :email, limit: 100
      t.string :ni, limit: 15
      t.float :capital
      t.string :pais, limit: 150

      t.timestamps
    end
  end
end
