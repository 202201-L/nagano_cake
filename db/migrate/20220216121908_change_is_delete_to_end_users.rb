class ChangeIsDeleteToEndUsers < ActiveRecord::Migration[6.1]
def change
  change_column_default(:end_users, :is_delete, false)
end
end
