class CreateUsersStatesMaterializedView < ActiveRecord::Migration[5.1]
  def change
    execute <<-SQL
      CREATE MATERIALIZED VIEW users_states_materialized_view AS
        SELECT state, COUNT(state) AS users_amount
        FROM users
        GROUP BY state
        ORDER BY state;

      CREATE UNIQUE INDEX unique_index_users_states_matview_on_states
        ON users_states_materialized_view (state);
    SQL
  end
end
