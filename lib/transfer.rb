require_relative "bank_account"
require "pry"

class Transfer
  
   attr_reader 
   attr_accessor :sender, :receiver, :status, :amount #sender and receiver are instances of accounts from the BankAccount class so they are ready to be acted upon.

   def initialize(sender, receiver, status="pending", amount)
      @sender = sender
      @receiver = receiver
      @status = status
      @amount = amount
   end

   def valid? #no arguments are provided
      @sender.valid? && @receiver.valid?
   end

   def execute_transaction
      unless @sender.valid?  && @status == "pending" && @amount < @sender.balance
         @status = "rejected"
         "Transaction rejected. Please check your account balance."
      else
         @sender.balance -= @amount
         @receiver.balance += @amount
         @status = "complete"
      end
   
      # if @sender.valid? && @receiver.valid? == true 
      # if @status == "pending"
      #    if @sender.valid? == true 
      #       @sender.balance -= @amount
      #       @receiver.balance += @amount
      #       @status = "complete"
      #    else
      #       # elsif @sender.valid? == "false"
      #    @status = "rejected"
      #    "Transaction rejected. Please check your account balance."
      #    end
      # else
      #    nil
      # end

   end

   def reverse_transfer
      if @status == "complete"
         @sender.balance += @amount
         @receiver.balance -= @amount
         @status = "reversed"
      end
   end


end
