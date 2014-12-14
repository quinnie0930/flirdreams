class User < ActiveRecord::Base
  has_many :awakes

  def make_awake_at(time)
    awakes.create(awake_time: time)
  end

  def get_sleep_cycle()
    last_awakes = awakes.where("awake_time > ?", 12.hours.ago).to_a

    total_time = 0;
    times = 0;
    last_awakes.each_with_index do |aw, index|

      if index < last_awakes.length - 1
        delta =  last_awakes[index + 1].awake_time - aw.awake_time
        if delta > 30.minutes
          total_time += delta
          times += 1
        end
      end
    end

    return times > 0 ? total_time / times / 3600.0 : 0 #in hour
  end
end
