class EventMailer < ApplicationMailer
    def new_event(event)
        @event = event

        U.all.each do |user|
            mail(to: user.email, subject: "New Event from Private Events")
        end

    end
end
