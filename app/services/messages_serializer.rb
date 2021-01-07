class MessagesSerializer

    def initialize(object)
        @message = object
    end

    def to_serialized_json
        options = {
            except: [:updated],
            methods: [:updated, :created, :author]
        }
        @message.to_json(options)
    end

end