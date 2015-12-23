RSpec.shared_examples 'aasm_event_raise' do |events|
  events.each do |event|
    it{ expect{ subject.send(event) }.to raise_error(AASM::InvalidTransition) }
  end
end
