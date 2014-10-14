module SeleniumPrep

  def self.debug_off?
    ENV['SE_DEBUG'] == 'off'
  end

end

module Kernel

  def puts(input)
    super input unless SeleniumPrep.debug_off?
  end

  def print(input)
    super input unless SeleniumPrep.debug_off?
  end

end
