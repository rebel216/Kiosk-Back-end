class AddUserRefToParcelCopies < ActiveRecord::Migration[7.0]
  def change
    add_reference :parcelcopies, :user, null: false, foreign_key: { on_delete: :cascade }
  end
end
