group 'redis' do
  system true
end

user 'redis' do
  gid 'redis'
  home '/var/lib/redis'
  shell '/bin/false'
  comment 'redis server,,,' # consistent w/ ubuntu 12.04 O.o
  system true
end