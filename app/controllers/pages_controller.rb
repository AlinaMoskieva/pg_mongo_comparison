class PagesController < ApplicationController
  expose :users, -> { UsersQuery.new.all }

  def statistics
  end
end
