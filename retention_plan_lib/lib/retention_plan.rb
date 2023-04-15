require_relative 'services/retention_plan_service'

class RetentionPlan
  def self.should_retain_snapshot?(plan, date)
    RetentionPlanService.should_retain_snapshot?(plan, date)
  end
end
