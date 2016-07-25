module ControllerMacros
  
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    
    def when_not_found(*actions)
      actions.each do |a|
        it ".#{a} render 404 when not found" do
          verb = if a == :update
            "PUT"
          elsif a == :destroy
            "DELETE"
          else
            "GET"
          end
          process a, verb, id: 0
          expect(response.status).to eq(404)
        end
      end
    end
    
  end
  
end