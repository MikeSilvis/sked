namespace :sked do
  desc "Hello"
  task :world => :environment do
    puts 'yolo'
  end
end
