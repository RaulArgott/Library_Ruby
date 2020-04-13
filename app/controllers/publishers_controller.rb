class PublishersController < ApplicationController
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
        @publisher.save
        redirect_to publisher_path(@publisher)
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
end
