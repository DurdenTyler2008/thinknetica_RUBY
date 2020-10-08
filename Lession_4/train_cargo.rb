class CargoTrain < Train
    attr_reader :type

    def initial_type(train)
        @type = "cargo"
        super
    end
end
