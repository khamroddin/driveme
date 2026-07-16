class Admin::MasterDataController < Admin::BaseController
  private

  def success_redirect(path, message)
    redirect_to path, notice: message
  end

  def validation_failed(view)
    render view, status: :unprocessable_entity
  end
end