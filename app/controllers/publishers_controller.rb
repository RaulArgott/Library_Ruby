class PublishersController < ApplicationController
    before_action :authorize_admin, except: [:index, :show]
    def index
        @publishers = all_publishers
    end
    def show
        @publisher = find_publisher_id
    end
    def new
        @publisher = Publisher.new
    end
    def create
        @publisher = Publisher.new(post_params(:name, :city))
        if @publisher.save
            render json: @publisher
        else
            #flash[:alert] = "Something gone wrong!"
            # render :new
            #render json: {errors: @publisher.errors.full.messages}
        end
    end
    def edit
        @publisher = find_publisher_id
    end    
    def update
        @publisher = find_publisher_id
        @publisher.update(post_params(:name, :city))
        redirect_to publisher_path(@publisher)
    end
    def destroy
        @publisher = find_publisher_id
        @publisher.destroy
        redirect_to publishers_path
    end

    private    
    def all_publishers
        Publisher.all
    end
    def find_publisher_id
        Publisher.find(params[:id])
    end
    def post_params(*args)
        params.require(:publisher).permit(*args)
    end

    def authorize_admin
        return unless !current_user.admin?
        redirect_to publishers_path, alert: 'Admins only!'
    end
end
