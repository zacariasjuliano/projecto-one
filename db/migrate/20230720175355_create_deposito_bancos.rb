class CreateDepositoBancos < ActiveRecord::Migration[5.2]
  def change
    create_table :deposito_bancos do |t|
      t.references :banco, foreign_key: true
      t.float :valor
      t.text :obs

      t.timestamps
    end
  end
end
