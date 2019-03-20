class PeopleQuery
  GROUP_BY_STATES_AND_COUNT = [
    {
      "$group" => {
        "_id" => "$state",
        "value" => {"$sum" => 1 }
      }
    },
    {
      "$sort" => { "_id" => 1 }
    },
    {
      "$project" => {
        "value" => 1
      }
    }
  ].freeze

  MAP = %Q{
    function() {
      emit(this.state, 1);
    }
  }.freeze

  REDUCE = %Q{
    function(state, values) {
      return Array.sum(values);
    }
  }.freeze

  def all
    Person.collection.aggregate(GROUP_BY_STATES_AND_COUNT)
  end

  def all_by_map_reduce
    Person.map_reduce(MAP, REDUCE).out(merge: "mr-statistic-results")
  end
end
