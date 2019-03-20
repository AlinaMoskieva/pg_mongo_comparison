desc "Update the UserStates materialized view"
task update_users_states_matview: :environment do
  UsersStatesMatview.refresh
end
