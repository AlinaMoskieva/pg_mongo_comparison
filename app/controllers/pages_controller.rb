class PagesController < ApplicationController
  expose :users, -> { UsersQuery.new.all }
  expose :users_from_matview, -> { UsersStatesMatview.all }
  expose :people, -> { PeopleQuery.new.all }
  expose :people_by_map_reduce, -> { PeopleQuery.new.all_by_map_reduce }

  def statistics
  end
end
