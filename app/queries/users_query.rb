class UsersQuery
  def all
    User
      .select("state, count(state) as users_amount")
      .group(:state)
      .order(:state)
  end
end
