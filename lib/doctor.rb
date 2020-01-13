require 'pry'
class Doctor

    attr_accessor :name, :appointments

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select do |appt|
            appt.doctor == self
        end
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def patients
        self.appointments.map do |appt|
            appt.patient
        end
    end


end