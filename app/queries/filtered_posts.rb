class FilteredPosts
  ALLOWED_PARAMS = %i[tags].freeze

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
end
