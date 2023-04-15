require 'rspec'
require_relative '../lib/retention_plan_rules'

describe RetentionPlanRules do
  describe 'STANDARD_RETENTION_DAYS' do
    it 'returns the correct value' do
      expect(RetentionPlanRules::STANDARD_RETENTION_DAYS).to eq(42)
    end
  end

  describe 'GOLD_RETENTION_DAYS' do
    it 'returns the correct value' do
      expect(RetentionPlanRules::GOLD_RETENTION_DAYS).to eq(42)
    end
  end

  describe 'GOLD_LAST_SNAPSHOT_MONTHS_RETENTION' do
    it 'returns the correct value' do
      expect(RetentionPlanRules::GOLD_LAST_SNAPSHOT_MONTHS_RETENTION).to eq(12)
    end
  end
  
  describe 'PLATINUM_RETENTION_DAYS' do
    it 'returns the correct value' do
      expect(RetentionPlanRules::PLATINUM_RETENTION_DAYS).to eq(42)
    end
  end

  describe 'PLATINUM_LAST_SNAPSHOT_MONTHS_RETENTION' do
    it 'returns the correct value' do
      expect(RetentionPlanRules::PLATINUM_LAST_SNAPSHOT_MONTHS_RETENTION).to eq(12)
    end
  end

  describe 'PLATINUM_LAST_SNAPSHOT_YEARS_RETENTION' do
    it 'returns the correct value' do
      expect(RetentionPlanRules::PLATINUM_LAST_SNAPSHOT_YEARS_RETENTION).to eq(7)
    end
  end

end
