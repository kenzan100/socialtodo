# encoding: utf-8

Job.all.each do |j|
  api = Koala::Facebook::API.new(j.user.token)
  api.put_connections("me", ENV['NAME_SPACE']+":"+ENV['ACTION_TYPE'], :task => "http://socialtodo.herokuapp.com/tasks/"+j.task_id.to_s)
  # api.put_connections("me", "social_todo:ganbare", :task => "http://socialtodo.herokuapp.com/tasks/"+j.task_id)
end

Job.delete_all
