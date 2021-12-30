class CreateLeads < ActiveRecord::Migration[7.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :hobby
      t.string :email
      t.string :gender

      t.timestamps
    end
  end
end
