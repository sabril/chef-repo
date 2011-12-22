execute "update-apt" do
  command "sudo apt-get update"
end

%w{curl git-core}.each do |pkg|
  package pkg do
    action :install
  end
end

# Allow the user to specify some other system packages to install
if node[:base].has_key?("system_packages")
  node[:base][:system_packages].each do |pkg|
    package pkg do
      action :install
    end
  end
end

# git "/home/vagrant/.oh-my-zsh" do
#   repository node[:base][:ohmyzsh]
#   action :checkout
#   user "vagrant"
#   group "vagrant"
# end
# 
# execute ".zshrc" do
#   command "cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc"
#   creates "/home/vagrant/.zshrc"
#   user "vagrant"
# end
# 
# execute "usermod -s /bin/zsh vagrant"

# VIM janus configuration
# git "/home/vagrant/.vim" do
#   repository node[:base][:janus_vim]
#   action :checkout
#   user "vagrant"
# end
# 
# execute "installation of janus vim" do
#   command "cd /home/vagrant/.vim; rake"
#   user "vagrant"
# end

# link "/home/vagrant/.vimrc" do
#   to "/home/vagrant/.vim/vimrc"
#   owner "vagrant"
# end
