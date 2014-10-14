module Kernel
  def puts(input)
    super input unless ENV['SE_DEBUG'] == 'off'
  end
end
