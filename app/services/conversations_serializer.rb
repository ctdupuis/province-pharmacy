class ConversationsSerializer

    def initialize(object)
        @conversation = object
    end

    def to_serialized_json
        options = {
            include: {
                messages: {
                    except: [:updated_at, :created_at],
                    methods: [:updated, :created]
                }
            },
            except: [:created_at, :updated_at]
        }
        @conversation.to_json(options)
    end
end