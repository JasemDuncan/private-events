class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :Events, :type, :typeof
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
