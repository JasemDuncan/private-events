class Event < ApplicationRecord
    #tablas => events
    #campos => event.name()
    #escribirmetodos 
    validates :name, presence: true, uniqueness: true
    validates :organizer, presence: true
    validates :description, presence: true, length: {minimum:20}
    validates :typeof, :category, :tags, :datestart, :dateend, :timestart, :timeend, :attendees, :location, :image, :link, presence: true
    # validates :typeof, presence: true
    # validates :category, presence: true
    # validates :tags, presence: true
    # validates :datestart, presence: true
    # validates :dateend, presence: true
    # validates :timestart, presence: true
    # validates :timeend, presence: true
    # validates :attendees, presence: true
    # validates :location, presence: true    
    # validates :link, presence: true

    has_many :usevents
    has_many :us, through: :usevents
    
    after_create :save_categories

    has_attached_file :cover, styles: {medium: "1280x720", thumb: "800x600"}
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

    #Custom setter
    def categories=(value) 
        @categories=value
    end
    private
    def save_categories
        @categories.each do |category_id|
            HasCategory.create(category_id: category_id, event_id: self.event.id)
        end
    end
end
