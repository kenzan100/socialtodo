class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook

    auth = env["omniauth.auth"]
    uid  = auth["uid"].to_s
    
    if user = User.find_by_facebook_id(uid)
      user.attributes = {:name => auth["info"]['name'], :token => auth["credentials"]['token']}
      user.save
    else
      user = User.create(:token => auth["credentials"]['token'],:facebook_id => uid, :name => auth["info"]["name"])
    end

    graph = Koala::Facebook::GraphAPI.new(auth["credentials"]['token'])
    @friends = graph.get_connections("me", "friends")

    @friend_id = Array.new
		@friends.each do |friend|
      @friend_id.push(friend['id'])
    end

    # TODO
		@friend_id.each do |friend|
      friend_user = User.where(:facebook_id => friend).first
      if friend_user.blank? === false && Friend.where(:user_id => user.id, :friend_user_id => friend_user.id).count === 0
        Friend.create(:user_id => user.id, :friend_user_id => friend_user.id)
      end
    end

    sign_in_and_redirect user
  end
end
