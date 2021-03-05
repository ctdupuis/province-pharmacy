class PostSerializer

    def initialize(object)
        @post = object 
    end

    def to_serialized_json
        options = {
            include: {
                comments: {
                    methods: [:created, :updated, :author],
                    except: [:created_at, :updated_at]
                }
            },
            methods: [:created, :updated, :author],
            except: [:created_at, :updated_at]
        }
        @post.to_json(options)
    end

end