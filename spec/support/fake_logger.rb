class FakeLogger
   LEVELS = %i(fatal error warn info debug).freeze
   def initialize
    @messages = LEVELS.inject({}) {|arr, level| arr[level] = []; arr }
   end
   LEVELS.each do |level|
    define_method level do |msg|
      @messages[level].push msg
    end
    define_method "has_#{level}_message?" do |msg|
      @messages.fetch(level).include?(msg) or fail %Q(#{self} doesn't call #{level} with "#{msg}")
    end
  end
   def messages(level)
    @messages[level.to_sym]
   end
 end
