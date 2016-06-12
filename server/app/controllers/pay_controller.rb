class PayController < ApplicationController
  include ActionView::Helpers::NumberHelper
  protect_from_forgery :except => :create, only: [:enter]
  before_filter :save_purchased_info, only: [:enter]
  before_filter :redirect_to_face, only: [:enter]
  before_filter :has_token?, only: [:card_register]
  
  def error
    
  end

  # realiza a cobrança
  def payment
    redirect_to '/pay/after_pay'
  end

  # mostra ultimo checkout
  def checkout
    t = Transaction.last
    company = Company.find_by_id t.company_id
    puts company
  	@seller = company.name
	  @info = t.info
    @value_number = t.value/100
    cookies[:value] = t.value
    cookies[:info] = t.info

    @users = Instituition.all

	  @value = number_to_currency(@value_number, :unit => "R$ ", :separator => ",", :delimiter => ".")
	  @donation = number_to_currency(@value_number*0.01, :unit => "R$ ", :separator => ",", :delimiter => ".")
  end

  # cadatra cartão
  def card_register
  	if current_client.token != nil
      # se já esta cadastrado redireciona para chechout
  		redirect_to '/pay/checkout'

  	end
  end

  def face_return # get verificação de cartao
    if current_client.token != nil
      redirect_to '/pay/checkout'
    else
      redirect_to '/pay/card_register'
    end
  end

  def save_card_info
    if params[:card] != ""
      puts params
      current_client.token = "ok"
      current_client.card = params[:card]
      current_client.m = params[:m]
      current_client.y = params[:y]
  		current_client.cv = params[:cv]
  		current_client.save
  		redirect_to '/pay/checkout'
  	else
  		redirect_to '/pay/card_register'
  	end
  end

  def enter
      redirect_to '/pay/card_register'
  end 

  def after_pay
    cardToken = Simplify::CardToken.create({
            "card" => {
             "expMonth" => current_client.m.to_s,
             "expYear" => current_client.y.to_s,
             "cvc" => current_client.cv.to_s,
             "number" => current_client.card
            }
    })
    var = {
        "token" => cardToken['id'],
        "amount" => cookies[:value].to_s,
        "currency"  => "USD",
        "description" => cookies[:info].to_s
    }
    puts var
    payment = Simplify::Payment.create(var)

    if payment['paymentStatus'] == 'APPROVED'
        puts "Payment approved"
    end
  end

  private 
  def save_purchased_info
    company = Company.find_by access_token: params[:access_token]
    if company != nil
      t = Transaction.new
      t.value = params[:value].to_i
      t.info = params[:info]
      t.company_id = company.id
      t.status = 0
      t.save
      session[:id] = t.id
      puts t.value
    else
      redirect_to error_path
    end
  end

  def has_token?
    puts 122222222222222222222222222222222222222229818918412481248912874781278412
    puts session[:client_id]
    if current_client.token != nil
      # se já esta cadastrado redireciona para chechout
      redirect_to '/pay/checkout'
    end
  end
end
