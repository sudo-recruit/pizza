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

desc "Create final version of image"
task ami: [:berks] do
  sh "packer build -var-file=variables.local.json packer.json"
end

task default: :ami
