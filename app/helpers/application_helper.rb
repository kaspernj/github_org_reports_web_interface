module ApplicationHelper
  def _(str)
    return t(str, :default => str)
  end
end
