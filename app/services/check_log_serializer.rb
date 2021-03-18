class CheckLogSerializer

    def initialize(object)
        @log = object
    end

    def to_serialized_json
        options = {
            include: {
                check_entries: {
                    methods: [:price_difference],
                    except: [:created_at, :updated_at]
                }
            }
        }
        @log.to_json(options)
    end

end