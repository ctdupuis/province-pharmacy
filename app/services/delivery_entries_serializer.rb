class DeliveryEntriesSerializer

    def initialize(object)
        @entry = object
    end

    def to_serialized_json
        options = {
            methods: [:created]
        }
        @entry.to_json(options)
    end

end