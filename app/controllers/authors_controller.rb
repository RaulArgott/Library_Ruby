class AuthorsController < ApplicationController
    before_action :authorize_admin, except: [:index, :show]
    def index
        @authors = all_authors
        flash.now[:notice] = "We have exactly #{@authors.size} authors available."
    end
    def show
        @author = find_author_id
    end
    def new
        @author = Author.new
    end
    def create
        @author = Author.new(post_params(:name, :last_name))
        if @author.save
            Author.dedupe
            render json: @author
        else
            # flash[:alert] = "Something gone wrong!"
            # render :new
            # render json: {errors: @author.errors.full.messages}
        end
        
    end
    def edit
        @author = find_author_id
    end    
    def update
        @author = find_author_id
        @author.update(post_params(:name, :last_name))
        redirect_to author_path(@author)
    end
    def destroy
        @author = find_author_id
        @author.destroy
        redirect_to authors_path
    end

    private    
    def all_authors
        Author.all
    end
    def find_author_id
        Author.find(params[:id])
    end
    def post_params(*args)
        params.require(:author).permit(*args)
    end

    def authorize_admin
        return unless !current_user.admin?
        redirect_to authors_path, alert: 'Admins only!'
    end
end
