require_relative '../lib/services/retention_plan_service'

RSpec.describe RetentionPlanService do
  describe '.should_retain_snapshot?' do
    context 'when plan is :standard' do
      context 'and date is within retention period' do
        it 'returns true' do
          date = Date.today - 40.days # within retention period for :standard plan
          expect(described_class.should_retain_snapshot?(:standard, date)).to eq(true)
        end
      end

      context 'and date is outside retention period' do
        it 'returns false' do
          date = Date.today - 43.days # outside retention period for :standard plan
          expect(described_class.should_retain_snapshot?(:standard, date)).to eq(false)
        end
      end
    end

    context 'when plan is :gold' do
      context 'and date is within retention period' do
        it 'returns true' do
          date = Date.today - 40.days # within retention period for :gold plan
          expect(described_class.should_retain_snapshot?(:gold, date)).to eq(true)
        end
      end

      context 'and date is outside retention period' do
        it 'returns false' do
          date = Date.today - 43.days # outside retention period for :gold plan
          expect(described_class.should_retain_snapshot?(:gold, date)).to eq(false)
        end
      end

      context 'and date is the last snapshot of the month' do
        context 'and date is within retention period' do
          it 'returns true' do
            date = Date.today.end_of_month - 2.months # within retention period for :gold plan
            expect(described_class.should_retain_snapshot?(:gold, date)).to eq(true)
          end
        end

        context 'and date is outside retention period' do
          it 'returns false' do
            date = Date.today.end_of_month - 3.months # outside retention period for :gold plan
            expect(described_class.should_retain_snapshot?(:gold, date)).to eq(false)
          end
        end
      end
    end

    context 'when plan is :platinum' do
      context 'and date is within retention period' do
        it 'returns true' do
          date = Date.today - 40.days # within retention period for :platinum plan
          expect(described_class.should_retain_snapshot?(:platinum, date)).to eq(true)
        end
      end

      context 'and date is outside retention period' do
        it 'returns false' do
          date = Date.today - 43.days # outside retention period for :platinum plan
          expect(described_class.should_retain_snapshot?(:platinum, date)).to eq(false)
        end
      end

      context 'and date is the last snapshot of the month' do
        context 'and date is within retention period' do
          it 'returns true' do
            date = Date.today.end_of_month - 2.months # within retention period for :platinum plan
            expect(described_class.should_retain_snapshot?(:platinum, date)).to eq(true)
          end
        end

        context 'and date is outside retention period' do
          it 'returns false' do
            date = Date.today.end_of_month - 3.months # outside retention period for :platinum plan
            expect(described_class.should_retain_snapshot?(:platinum, date)).to eq(false)
          end
        end
      end

      context 'and date is the last snapshot of the year' do
        context 'and date is within retention period' do
          it 'returns true' do
            date = Date.today.end_of_year - 2.years # within retention period for :platinum plan
            expect(described_class.should_retain_snapshot?(:platinum, date)).to eq(true)
          end
        end

        context 'and date is outside retention period' do
          it 'returns false' do
            date = Date.today.end_of_year - 8.years # outside retention period for :platinum plan
            expect(described_class.should_retain_snapshot?(:platinum, date)).to eq(false)
          end
        end
      end
    end
    
    context 'when plan is invalid' do
      it 'raises ArgumentError' do
        date = Date.today
        expect { described_class.should_retain_snapshot?(:invalid_plan, date) }.to raise_error(ArgumentError)
      end
    end
    
    context 'when date is invalid' do
      it 'raises ArgumentError' do
        plan = :standard
        expect { described_class.should_retain_snapshot?(plan, 'invalid_date') }.to raise_error(ArgumentError)
      end
    end

    context 'when plan and date are invalid' do
      it 'raises ArgumentError' do
        expect { described_class.should_retain_snapshot?(:invalid_plan, 'invalid_date') }.to raise_error(ArgumentError)
      end
    end

    context 'when plan is nil' do
      it 'raises ArgumentError' do
        date = Date.today
        expect { described_class.should_retain_snapshot?(nil, date) }.to raise_error(ArgumentError)
      end
    end

    context 'when date is nil' do
      it 'raises ArgumentError' do
        plan = :standard
        expect { described_class.should_retain_snapshot?(plan, nil) }.to raise_error(ArgumentError)
      end
    end

    context 'when plan and date are nil' do
      it 'raises ArgumentError' do
        expect { described_class.should_retain_snapshot?(nil, nil) }.to raise_error(ArgumentError)
      end
    end
  end
end
