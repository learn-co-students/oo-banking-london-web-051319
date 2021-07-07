require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @status == "pending" && @sender.balance > @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
    elsif @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
end

  def reverse_transfer
    temp = @sender
    @sender = @receiver
    @receiver = temp
    if @status == "complete"
      @status = "pending"
      execute_transaction
      @status = "reversed"
    end
  end
end