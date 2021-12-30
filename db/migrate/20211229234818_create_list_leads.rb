class CreateListLeads < ActiveRecord::Migration[7.0]
  def change
    create_table :list_leads do |t|
      t.belongs_to :list, null: false, foreign_key: true
      t.belongs_to :lead, null: false, foreign_key: true
      t.timestamps
    end
  end
end
