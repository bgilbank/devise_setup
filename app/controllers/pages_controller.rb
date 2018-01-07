class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:titletag, :meta, :tile, :slug, :body)
    end
end
