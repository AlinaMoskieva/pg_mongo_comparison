class PeopleQuery
  GROUP_BY_STATES_AND_COUNT = [
    {
      "$group" => {
        "_id" => "$state",
        "users_amount" => {"$sum" => 1 }
      }
    },
    {
      "$sort" => { "_id" => 1 }
    },
    {
      "$project" => {
        "state" => "$_id",
        "users_amount" => 1,
        "_id" => 0
      }
    }
  ].freeze

  def all
    Person.collection.aggregate(GROUP_BY_STATES_AND_COUNT)
  end
end
