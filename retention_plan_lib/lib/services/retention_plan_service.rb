require_relative 'retention_plan_validation_service'
require_relative '../retention_plan_rules'
require 'active_support/all'

class RetentionPlanService
  include RetentionPlanRules

  def self.should_retain_snapshot?(plan, date)
    RetentionPlanValidationService.call(plan, date)

    case plan
    when :standard
      date >= STANDARD_RETENTION_DAYS.days.ago
    when :gold
      date >= GOLD_RETENTION_DAYS.days.ago || (date.end_of_month == date && date >= GOLD_LAST_SNAPSHOT_MONTHS_RETENTION.months.ago)
    when :platinum
      date >= PLATINUM_RETENTION_DAYS.days.ago || (date.end_of_month == date && date >= PLATINUM_LAST_SNAPSHOT_MONTHS_RETENTION.months.ago) || 
      (date.end_of_year == date && date >= PLATINUM_LAST_SNAPSHOT_YEARS_RETENTION.years.ago)
    else
      raise ArgumentError, "Invalid retention plan"
    end
  end
end
