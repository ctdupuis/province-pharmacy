class ScheduleSerializer

    def initialize(object)
        @schedule = object 
    end

    def to_serialized_json
        options = {
            include: {
                shifts: {
                    except: [:created_at, :updated_at]
                },
                user: {
                    only: [:first_name, :last_name, :username]
                }
            },
            except: [:created_at]
        }
        @schedule.to_json(options)
    end
end