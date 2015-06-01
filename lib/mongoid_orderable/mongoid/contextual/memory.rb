module MongoidOrderable #:nodoc:
  module Mongoid #:nodoc:
    module Contextual #:nodoc:
      module Memory #:nodoc:
        def inc(* args)
          each do |document|
            document.inc *args
            if document.updated_at.present?
              document.updated_at = Time.now
              document.save
            end
          end
        end
      end
    end
  end
end

Mongoid::Contextual::Memory.send :include, MongoidOrderable::Mongoid::Contextual::Memory
