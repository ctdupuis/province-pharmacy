class PostSerializer

    def initialize(object)
        @post = object 
    end

    def to_serialized_json
        time_format = "%a %m/%e/%S %l:%e %P"
        options = {
            include: {
                comments: {
                    methods: [:created, :updated],
                    except: [:created_at, :updated_at]
                }
            },
            methods: [:created, :updated],
            except: [:created_at, :updated_at]
        }
        @post.to_json(options)
    end
end