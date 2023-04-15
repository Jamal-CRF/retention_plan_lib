require 'date'
class RetentionPlanValidationService
  def self.call(plan, date)
    unless [:standard, :gold, :platinum].include?(plan)
      raise ArgumentError, "Invalid retention plan: #{plan.inspect}. Valid plans are :standard, :gold, or :platinum."
    end
    unless date.is_a?(Date) || date.is_a?(Time)
      raise ArgumentError, "Invalid date format: #{date.inspect}. The date parameter must be a Date or Time object."
    end
  end
end
