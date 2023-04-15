require_relative '../lib/services/retention_plan_validation_service'

RSpec.describe RetentionPlanValidationService do
  describe '.call' do
    context 'when plan is valid' do
      it 'does not raise an error' do
        plan = :standard
        date = Date.today
        expect { described_class.call(plan, date) }.not_to raise_error
      end
    end
    
    context 'when plan is invalid' do
      it 'raises ArgumentError' do
        plan = :invalid_plan
        date = Date.today
        expect { described_class.call(plan, date) }.to raise_error(ArgumentError)
      end
    end
    
    context 'when date is a Date object' do
      it 'does not raise an error' do
        plan = :standard
        date = Date.today
        expect { described_class.call(plan, date) }.not_to raise_error
      end
    end
    
    context 'when date is a Time object' do
      it 'does not raise an error' do
        plan = :standard
        date = Time.now
        expect { described_class.call(plan, date) }.not_to raise_error
      end
    end
    
    context 'when date is a String' do
      it 'raises ArgumentError' do
        plan = :standard
        date = 'invalid_date'
        expect { described_class.call(plan, date) }.to raise_error(ArgumentError)
      end
    end
    
    context 'when date is an Integer' do
      it 'raises ArgumentError' do
        plan = :standard
        date = 12345
        expect { described_class.call(plan, date) }.to raise_error(ArgumentError)
      end
    end
    
    context 'when plan is nil' do
      it 'raises ArgumentError' do
        plan = nil
        date = Date.today
        expect { described_class.call(plan, date) }.to raise_error(ArgumentError)
      end
    end
    
    context 'when date is nil' do
      it 'raises ArgumentError' do
        plan = :standard
        date = nil
        expect { described_class.call(plan, date) }.to raise_error(ArgumentError)
      end
    end
    
    context 'when plan and date are nil' do
      it 'raises ArgumentError' do
        plan = nil
        date = nil
        expect { described_class.call(plan, date) }.to raise_error(ArgumentError)
      end
    end

    context 'when plan is :standard' do
      it 'does not raise an error' do
        plan = :standard
        date = Date.today
        expect { described_class.call(plan, date) }.not_to raise_error
      end
    end

    context 'when plan is :gold' do
      it 'does not raise an error' do
        plan = :gold
        date = Date.today
        expect { described_class.call(plan, date) }.not_to raise_error
      end
    end

    context 'when plan is :platinum' do
      it 'does not raise an error' do
        plan = :platinum
        date = Date.today
        expect { described_class.call(plan, date) }.not_to raise_error
      end
    end
  end
end
