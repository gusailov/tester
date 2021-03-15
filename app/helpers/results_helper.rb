module ResultsHelper
  def success_message(result)
    result.success? ? "Test #{result.test.title}  completed with" : "Test #{result.test.title} NOT completed with"
  end
end
