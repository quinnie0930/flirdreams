class Awake < ActiveRecord::Base
  belongs_to :user
  def get_sleep_cycle()
    #get the last 10 awake time when the user moves and average to get the sleep cycle
    last_awake_time = Awake(last).wake_time
    last=Awake.length-1

    while(last>0)
      difference=(awake_time[last]-awake[time[last-1])/1000/60
      if difference>30
         total+=difference
         total_count+=1
      end
      last=last-1
    end
    return total/total_count
  end
end
