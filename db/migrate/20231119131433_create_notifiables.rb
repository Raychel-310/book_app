class CreateNotifiables < ActiveRecord::Migration[6.1]
  def change
    create_table :notifiables do |t|

      t.timestamps
    end
  end
end
