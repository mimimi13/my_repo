module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethons
  end


  module ClassMethods
    def instance_count
      @instence ||= 0
      @instence +=1
    end

    def instance
     @instence
    end
  end


  module InstanceMethons
    private

    def register_instance
      self.class.instance_count
    end
  end
end
