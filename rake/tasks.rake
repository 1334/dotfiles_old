desc "Run ctags on current project and gems dir if using rvm"
task :rvm_ctags do
  %x{ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*}
end

desc "Run ctags on current project and gems dir if using rbenv"
task :rbenv_ctags do
  %x{ctags --extra=+f --exclude=.git --exclude=log -R * ~/.rbenv/versions/1.9.3-p125/lib/ruby/gems/1.9.1/gems/* }
end

