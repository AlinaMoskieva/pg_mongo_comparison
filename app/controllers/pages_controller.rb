class PagesController < ApplicationController
  expose :users, -> { UsersQuery.new.all }

  def home
  end
end
