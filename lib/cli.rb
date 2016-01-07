class CLI < Thor
  desc "min", "wait xx minute(s)"
  def min(*args)
    if args.count == 1
      TimeAlert.alert args[0].to_f
    end
  end

  desc "stop", "stop alarm"
  def stop
    TimeAlert.stop
  end
end
