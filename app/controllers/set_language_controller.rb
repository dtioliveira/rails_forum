class SetLanguageController < ApplicationController

  def portuguese
    I18n.locale = 'pt-BR'
    set_session_and_redirect
  end

  def spanish
    I18n.locale = :es
    set_session_and_redirect
  end

  private
  def set_session_and_redirect
    session[:locale] = I18n.locale
      redirect_to :back
    rescue
      redirect_to :root
  end
end
