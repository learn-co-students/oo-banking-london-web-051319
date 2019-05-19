class Transfer

attr_accessor :status, :sender, :receiver, :amount, :last

@last = 0

def initialize(sender, receiver, amount)
  @amount = amount
  @sender = sender
  @receiver = receiver
  @status = "pending"
end

def valid?
  @sender.valid? && @receiver.valid?
end

def execute_transaction
    @sender.withdraw(@amount)
  if @sender.valid?
    @receiver.deposit(@amount)
    @status = "complete"
    @last = @amount
    @amount = 0
  else
    @sender.deposit(@amount)
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
    @receiver.withdraw(@last)
    @sender.deposit(@last)
    @last = 0
    @status = "reversed"
  else
    nil
end
end


end
