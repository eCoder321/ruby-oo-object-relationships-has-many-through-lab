class Patient
    @@all = []

    attr_reader :name

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select {
            |appointment_instance|
            appointment_instance.patient == self
        }
    end

    def doctors
        appointments.collect{
            |appointment_instance|
            appointment_instance.doctor
        }
    end

    def self.all
        @@all
    end
end
