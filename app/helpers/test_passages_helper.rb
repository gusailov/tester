module TestPassagesHelper
  def success_message(result)
    result.success? ? "success" : "failure"
  end
end
