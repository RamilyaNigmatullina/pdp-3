class FilteredPosts
  ALLOWED_PARAMS = %i[tags created_at_from created_at_until state].freeze

  attr_reader :relation, :filter_params
  private :relation, :filter_params

  def initialize(relation, filter_params = {})
    @relation = relation
    @filter_params = filter_params
  end

  def all
    filter_params.slice(*ALLOWED_PARAMS).reduce(relation) do |relation, (key, value)|
      next relation if value.blank?

      send("by_#{key}", relation, value)
    end
  end

  private

  def by_tags(relation, tags)
    relation.tagged_with(tags.split, wild: true, any: true)
  end

  def by_created_at_from(relation, min_date)
    relation.where("posts.created_at >= ?", min_date)
  end

  def by_created_at_until(relation, max_date)
    relation.where("posts.created_at <= ?", max_date)
  end

  def by_state(relation, state)
    relation.where(state: state)
  end
end
