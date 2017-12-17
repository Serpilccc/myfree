class AddCacheVotesToCourses < ActiveRecord::Migration[5.1]
  def self.up
    add_column :courses, :cached_scoped_subscribe_votes_total, :integer, :default => 0
    add_column :courses, :cached_scoped_subscribe_votes_score, :integer, :default => 0
    add_column :courses, :cached_scoped_subscribe_votes_up, :integer, :default => 0
    add_column :courses, :cached_scoped_subscribe_votes_down, :integer, :default => 0
    add_column :courses, :cached_weighted_subscribe_score, :integer, :default => 0
    add_column :courses, :cached_weighted_subscribe_total, :integer, :default => 0
    add_column :courses, :cached_weighted_subscribe_average, :float, :default => 0.0
    add_index  :courses, :cached_scoped_subscribe_votes_total
    add_index  :courses, :cached_scoped_subscribe_votes_score
    add_index  :courses, :cached_scoped_subscribe_votes_up
    add_index  :courses, :cached_scoped_subscribe_votes_down
    add_index  :courses, :cached_weighted_subscribe_score
    add_index  :courses, :cached_weighted_subscribe_total
    add_index  :courses, :cached_weighted_subscribe_average
  end

  def self.down
    remove_column :courses, :cached_scoped_subscribe_votes_total
    remove_column :courses, :cached_scoped_subscribe_votes_score
    remove_column :courses, :cached_scoped_subscribe_votes_up
    remove_column :courses, :cached_scoped_subscribe_votes_down
    remove_column :courses, :cached_weighted_subscribe_score
    remove_column :courses, :cached_weighted_subscribe_total
    remove_column :courses, :cached_weighted_subscribe_average
  end
end


