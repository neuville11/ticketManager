class CreateAdministratives < ActiveRecord::Migration[5.1]
  def change
    create_table :administratives do |t|
      t.string :cellphone

      t.timestamps
    end
  end
end
