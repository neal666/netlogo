;;refresh
to setup
 clear-all
 
 set-default-shape turtles "circle"
 create-turtles num-turtles
 [
 set color green
 setxy random-xcor random-ycor
 ]
 
 reset-ticks
end


;;Main process
to go
 ifelse mouse-inside?
 [
 ask turtles
  [
  facexy mouse-xcor mouse-ycor
  forward 1
  ask other turtles in-radius linkcreateradius
   [
   create-link-to myself
   ]
  ]
 ]
 
 [
 ask turtles
  [
  forward 1
  ask other turtles in-radius linkcreateradius
   [
   create-link-to myself
   ]
  ]
 ]
 
 ;;Remove link while the two turtles are getting apart
  ask links
  [
  ifelse link-length > linkcreateradius
  [die]
  [set thickness link-length / 100]
  ]
end
