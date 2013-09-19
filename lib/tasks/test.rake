Rake::Task['test'].clear

task :test do
  $LOAD_PATH.unshift('test')
  Dir.glob('./test/**/*_test.rb') { |f| require f }
end
