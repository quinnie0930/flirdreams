class User < ActiveRecord::Base
  has_many :awakes

  def make_awake_at(time)
    awakes.create(awake_time: time)
  end

  def get_sleep_cycle()
    #get the last 10 awake time when the user moves and average to get the sleep cycle
    last_awakes = awakes.where("awake_time > ?", 12.hours.ago).to_a

    last_awake_time = last_awakes.last.awake_time
    last = last_awakes.length - 1

    total_time = 0;
    times = 0;
    last_awakes.each_with_index do |aw, index|
      p index
      if index < last_awakes.length - 1
        delta =  last_awakes[index + 1].awake_time - aw.awake_time
        if delta > 30.minutes
          total_time += delta
          times += 1
        end
      end
    end

    # while(last>0)
    #   difference=(last_awakes[last]-awake[time[last-1])/1000/60
    #   if difference>30
    #      total+=difference
    #      total_count+=1
    #   end
    #   last=last-1
    # end
    return times > 0 ? total_time / times : 0 #in miliseconds
  end
end
