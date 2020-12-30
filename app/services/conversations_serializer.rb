class ConversationsSerializer

    def initialize(object)
        @conversation = object
    end

    def to_serialized_json
        options = {
            include: {
                messages: {
                    except: [:updated_at]
                }
            },
            except: [:created_at]
        }
        @conversation.to_json(options)
    end
end