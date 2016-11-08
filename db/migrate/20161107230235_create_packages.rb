class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.string :to
      t.string :from

      t.timestamps
    end
  end
end
