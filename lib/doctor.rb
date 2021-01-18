class Doctor
    @@all = []

    attr_reader :name

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def appointments
        #binding.pry
        Appointment.all.select {
            |appointment_instance|
            appointment_instance.doctor == self
        }
    end

    def patients
        self.appointments.collect{
            |appointment_instance|
            #binding.pry
            appointment_instance.patient
        }
    end

    def self.all
        @@all
    end

end
