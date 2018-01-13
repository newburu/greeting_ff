namespace :auto_update_data do
  desc "自動でデータを更新するタスク"

  task :all_update => :environment do
    User.auto_update_users.each do |user|
      # 更新
      Follower.update_followers(user.twitter_client, user)
      Friend.update_friends(user.twitter_client, user)

      # 結果をDM連絡
      user.send_dm(user.twitter_client)
    end
  end
end
