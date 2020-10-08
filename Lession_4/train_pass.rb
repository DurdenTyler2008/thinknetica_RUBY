class PassengerTrain < Train
    attr_reader :type

    def initial_type(train)
        @type = "pass"
        super
    end

end
