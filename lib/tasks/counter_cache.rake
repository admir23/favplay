desc 'Counter cache for song has many favorites'

task task_counter: :environment do
  Song.reset_column_information
  Song.pluck(:id).each do |s|
    Song.reset_counters s.id, :favorites
  end
end