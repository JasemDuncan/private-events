class Event < ApplicationRecord
    include AASM

    #tablas => events
    #campos => event.name()
    #escribirmetodos 
    validates :name, presence: true, uniqueness: true
    validates :organizer, presence: true
    validates :description, presence: true, length: {minimum:20}
    validates :typeof, :tags, :datestart, :dateend, :timestart, :timeend, :attendees, :location, :link, presence: true

    has_many :usevents, dependent: :destroy
    has_many :us, through: :usevents
    has_many :has_categories, dependent: :destroy
    has_many :categories, through: :has_categories
    
    after_create :save_categories #callback from the model

    has_attached_file :cover, styles: {medium: "1080x520", thumb: "500x300"}
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

    #Is the same
    # def self.publicated
    #     Event.where(state: "published")
    # end

    #Add scopes
    scope :publicated, -> {where(state: "published")}
    scope :lastt, -> {order("created_at DESC")}

    #Custom setter
    def categories=(value) 
        @categories=value
    end
    #aasm gem syntax
    aasm column: "state" do
        state :in_draft, initial: true
        state :published

        event :publish do
            transitions from: :in_draft, to: :published
        end

        event :unpublish do
            transitions from: :published, to: :in_draft
        end

    end

    private
    def save_categories
        @categories.each do |category_id|
            HasCategory.create(category_id: category_id, event_id: self.id)
        end
    end
end
