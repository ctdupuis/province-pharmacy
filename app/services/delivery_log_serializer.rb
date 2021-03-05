class DeliveryLogSerializer

    def initialize(object)
        @log = object
    end

    def to_serialized_json
        options = {
            include: {
                delivery_entries: {
                    methods: [:created],
                    except: [:updated_at, :created_at]
                    user: {
                        only: [:username]
                    }
                }
            }
        }
        @log.to_json(options)
    end

end