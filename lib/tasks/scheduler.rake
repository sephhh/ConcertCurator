desc "Clears out database and seeds new data from Seatgeek"
task :update_seed_data => :environment do
  puts "Dropping old data..."
  ArtistEvent.destroy_all
  ArtistGenre.destroy_all
  Artist.destroy_all
  Event.destroy_all
  Genre.destroy_all
  Venue.destroy_all
  puts "Updating seed data..."
  Rake::Task['db:seed'].invoke
  puts "done."
end