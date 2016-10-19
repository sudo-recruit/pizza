include_recipe "poise-monit"

monit 'monit' do
  daemon_interval 30
end