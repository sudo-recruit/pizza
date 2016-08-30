desc "Install dependencies via Berkshelf"
task :berks do
  Dir.chdir "pizza" do
    sh "berks vendor ../vendor"
  end
end

desc "Create base image to accelerate building process"
task base_ami: [:berks] do
  sh "packer build -var-file=variables.local.json packer-without-app.json"
end

desc "Create image with application"
task ami: [:berks] do
  sh "packer build -var-file=variables.local.json packer.json"
end

desc "Create image in CI"
task ami_ci: [:berks] do
  sh "packer build " +
    "-var base_ami='#{ENV["BASE_AMI"]}' " +
    "-var consul_key_dir='#{ENV["CONSUL_KEY_DIR"]}' " +
    "-var database_url='#{ENV["PACKER_DATABASE_URL"]}' " +
    "-var deploy_to='#{ENV["DEPLOY_TO"]}' " +
    "-var repository='#{ENV["REPOSITORY"]}' " +
    "-var secret_key_base='#{ENV["SECRET_KEY_BASE"]}' " +
    "-var security_group_id='#{ENV["SECURITY_GROUP_ID"]}' " +
    "-var ssh_key='#{ENV["SSH_KEY"]}' " +
    "-var username='#{ENV["USERNAME"]}' " +
    "packer-ci.json"
end

task default: :ami
