class ChangeDataTypeToGender < ActiveRecord::Migration[7.0]
  def change
    change_column(:profiles, :gender, :string)
  end
end
