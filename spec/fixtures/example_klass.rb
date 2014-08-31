class ExampleKlass
  include Sked::Worker
  append_job({:time => 0, :type => :daily})
end
