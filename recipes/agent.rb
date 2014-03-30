group 'go' do
    action :create
end

user 'go' do
  supports :manage_home => true
  comment 'Go agent user'
  uid 1222
  gid 'go'
  home '/home/go'
  password '$6$.YxquAUcMx.$YUV1GLVpUz1GD8G8xlmQs.hAMOTuvR7HTj/Jy6kApVWbirx.EjiMW8fnqMOJJFWu30sbOjeyppg5RV8TuGZiE0'
end

include_recipe 'go-cookbook::agent'
