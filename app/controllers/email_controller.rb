class EmailController < ApplicationController
  def index
    @email = Email.all
  end

  def create
    @email = Email.create(object: Faker::GreekPhilosophers.name, body: Faker::GreekPhilosophers.quote)

    respond_to do |format|
      format.html { redirect_to email_index_path}
      format.js { }
    end
  end

  def show
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html { redirect_to email_index_path}
      format.js { }
    end 
  end

  def update
    @email = Email.find(params[:id])

    @email.update!(read: !@email.read)

    respond_to do |format|
      format.html { redirect_to email_index_path}
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to email_index_path }
      format.js { }
    end
  end

end
