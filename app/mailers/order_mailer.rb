# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default from: 'no-reply@marketplace.com'
  def send_confirmation(order)
    @order = order
    @user = @order.user
    mail to: @user.email, subject: t('order_confiramtion')
  end
end
