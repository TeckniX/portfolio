class RssRecord < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :owner, polymorphic: true

  # Validations: presence > by type > validates

  # Other properties (e.g. accepts_nested_attributes_for)

  # Model dictionaries, state machine

  # Scopes

  # Other model methods

  # Private methods (for example: custom validators)
  private
end
