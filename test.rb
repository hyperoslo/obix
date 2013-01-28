require "obix"

OBIX.configure do |config|
  config.scheme   = "https"
  config.host     = "89.221.246.72"
  config.username = "HyperoBIX"
  config.password = "RemaObix12"
end

history = OBIX.parse url: "/obix/histories/REMA2370/KM01$20T1/~historyQuery?start=2012-11-16T08:21:41.043+01:00&end=2012-11-23T08:21:41.043+01:00"

list = history.objects.find { |o| o.name == "data" }

list.objects.each do |item|
  time = item.objects.find { |o| o.name == "timestamp" }
  value = item.objects.find { |o| o.name == "value" }

  puts "#{time}: #{value}"
end

#watch = OBIX::Watch.make url: "https://89.221.246.72/obix/watchService"
#
#3.times do
#  puts "Polling changes..."
#  
#  objects = watch.all
#
#  puts "#{objects.count} references are being watched:"
#
#  objects.each do |object|
#    puts object.href
#  end
#
#  sleep 5
#end
