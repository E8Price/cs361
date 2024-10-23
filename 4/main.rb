# Exercise 5 Part 1 (Exception Handling)

class MentalState
  def auditable?
  end

  def audit!
    raise 'External service is offline' unless auditable?
  end

  def do_work
  end
end

def audit_sanity(bedtime_mental_state)
  begin
    bedtime_mental_state.audit!
    MorningMentalState.new(:ok)
  rescue StandardError => e
    MorningMentalState.new(:not_ok)
  end
end

new_state = audit_sanity(bedtime_mental_state)
puts "Audit failed" if new_state.is_a?(MorningMentalState) && new_state.state == :not_ok




# Exercise 5 Part 2 (Don't Return Null / Null Object Pattern)

class BedtimeMentalState < MentalState ; end

class MorningMentalState < MentalState
  attr_reader :state

  def initialize(state)
    @state = state
  end

  def do_work

  end
end

class NullMorningMentalState < MorningMentalState
  def initialize
    super(:null)
  end

  def do_work

  end
end

def audit_sanity(bedtime_mental_state)
  return NullMorningMentalState.new unless bedtime_mental_state.auditable?

  if bedtime_mental_state.audit!.ok?
    MorningMentalState.new(:ok)
  else
    MorningMentalState.new(:not_ok)
  end
end

new_state = audit_sanity(bedtime_mental_state)
new_state.do_work  


# Exercise 5 Part 3 (Wrapping APIs)

require 'candy_service'

class CandyMachineWrapper
  def initialize(machine)
    @machine = machine
  end

  def prepare_and_make
    @machine.prepare
    if @machine.ready?
      @machine.make!
    else
      handle_machine_not_ready
    end
  end

  private

  def handle_machine_not_ready
    puts "Machine is not ready. Unable to make candy."
  end
end

machine = CandyMachine.new
CandyMachineWrapper.new(machine).prepare_and_make
