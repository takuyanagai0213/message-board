class MessagesController < ApplicationController
    before_aciton :set_message, only: [:show, :edit, :update, :destroy]
    
    def index
      @messages = Message.all
    end
    
    def show
    end
    
    def new
      @message = Message.new
    end
    
    def create
      @message = Message.new(message_params)
      
      if @message.save
        flash[:success] = 'Message が正常に投稿されました'
        redirect_to @message
      else
        flash.now[:danger] = 'Message が投稿されませんでした'
      end
    end
    
    def edit
    end
    
    def update
      if @message.update(message_params)
        flash[:success] = 'Message が正常に更新されました'
        redirect_to @message
      else
        flash.now[:danger] = 'Message が更新されませんでした'
      end
    end
    
    def destroy
      @message.destroy
      
      flash[:success] = 'Message は正常に削除されました'
      redirect_to messages_url
    end
    
    private
    
    # Strong Parametar
    def set_message
      @task = Task.find(params[:id])
    end
    
    def message_params
      params.require(:message).permit(:content)
    end
end
