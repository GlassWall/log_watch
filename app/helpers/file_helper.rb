module FileHelper
  def find_match(pattern:,freq:,duration:,wait_time:)
    f = File.open(Rails.root.join("log_file.txt"),"r")
    f.seek(0,IO::SEEK_END)
    found = false
    time_start = Time.now
    time_found = nil
    time_last = nil
    count = 0
    window = []
    while true do
      if count == freq
        if Time.now - time_start <= duration
          alert_type =  pattern.inspect.split("/")[1]
          action_takers = Alert.where(alert_type: pattern.inspect.split("/")[1]).first.action_takers
          action_takers.each do |x|
            p x.name + " Kindly take action on alert" 
          end
          sleep wait_time
        else
          window.pop
          time_start = window.first
          count = count - 1
        end
      else
        window.pop
      end
      select([f])
      line = f.gets
      if line=~pattern
        found = true
        window.append([time_found])
        time_found = Time.now
        count = count + 1
      end
    end
  end
end