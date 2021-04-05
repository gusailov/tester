module TestPassagesHelper
  def success_message(result)
    result.success? ? "success" : "danger"
  end
end
