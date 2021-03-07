class DeliveryEntrySerializer

    def initialize(object)
        @entry = object
    end

    def to_serialized_json
        options = {
            include: {
                user: {
                    only: [:username]
                },
                methods: [:created],
                except: [:updated_at, :created_at]
            }
        }
        @entry.to_json(options)
    end

end