class UserSerializer 

    def initialize(object)
        @user = object
    end

    def to_serialized_json
        options = {
            include: [:id, :username, :first_name, :last_name, :email, :phone],
            except: [:created_at, :updated_at]
        }
        @user.to_json(options)
    end
end