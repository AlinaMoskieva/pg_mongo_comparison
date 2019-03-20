class UsersStatesMatview < ApplicationRecord
  self.table_name = "users_states_materialized_view"

  def readonly?
    true
  end

  def self.refresh
    ActiveRecord::Base.connection.execute("REFRESH MATERIALIZED VIEW CONCURRENTLY users_states_materialized_view")
  end
end
