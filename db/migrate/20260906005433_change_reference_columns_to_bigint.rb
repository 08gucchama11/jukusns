class ChangeReferenceColumnsToBigint < ActiveRecord::Migration[8.0]
  def change
    change_column :comments, :post_id, :bigint
    change_column :comments, :sns_profile_id, :bigint

    change_column :follows, :follower_sns_profile_id, :bigint
    change_column :follows, :followed_sns_profile_id, :bigint

    change_column :instruction_records, :teacher_id, :bigint
    change_column :instruction_records, :student_id, :bigint

    change_column :likes, :post_id, :bigint
    change_column :likes, :sns_profile_id, :bigint

    change_column :posts, :sns_profile_id, :bigint

    change_column :sessions, :admin_id, :bigint
    change_column :sessions, :teacher_id, :bigint
    change_column :sessions, :student_id, :bigint

    change_column :sns_profiles, :student_id, :bigint
    change_column :sns_profiles, :teacher_id, :bigint
  end
end
