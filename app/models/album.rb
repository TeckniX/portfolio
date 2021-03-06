class Album < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  has_many :images, dependent: :destroy

  # Validations: presence > by type > validates
  validates_presence_of :title
  validates_uniqueness_of :title

  # Other properties (e.g. accepts_nested_attributes_for)

  # Model dictionaries, state machine

  # Scopes

  scope :by_weight, ->() { order('"albums"."weight" DESC') }

  scope :published, -> { where(is_published: true) }

  scope :recent, -> { joins(:images).where(Image.arel_table[:created_at].gt(Time.now - 1.day)).limit(1) }

  # Other model methods

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end

  def is_recent?
    Album.where(id: self.id).recent.size > 0
  end

  # Private methods (for example: custom validators)
  private
end
