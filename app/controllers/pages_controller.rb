class PagesController < ApplicationController
  expose :users, -> { UsersQuery.new.all }
  expose :users_from_matview, -> { UsersStatesMatview.all }
  expose :people, -> { PeopleQuery.new.all }

  def statistics
  end
end
