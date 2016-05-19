require 'rubygems'
require 'dumbvfd'
require 'weatherboy'
exit if Object.const_defined?(:Ocra) #allow ocra to create an exe without executing the entire script

vfd = Vfd.new("COM7")
	loop do
		weather = Weatherboy.new(44041)
		forcast = weather.current
		vfd.connect
		vfd.clear_screen
		vfd.display("Current Conditions")
		vfd.display("#{forcast.weather}") #20 characters per segment
		vfd.close
		sleep(900)
		vfd.connect
		vfd.clear_screen
		vfd.display("Updating...")
		sleep(5)
		vfd.clear_screen
		vfd.close
	end