# RobotsDilemma
A robot who need instructions to walk on some board :D

## Installation
### Local
First you need to install ruby. Note that it's version should be higher than `` 2.4.0``

then run 
```bigquery
bundle install
```

### Docker
Build the image using the following command:
```
 docker build -t robots_dilemma .
```
And run it using 
```
 docker run -it --name robots_dilemma_instance robots_dilemma
```

## Usage
Set env variables for board dimensions(if not set, the default value is 5) 

```bigquery
export BOARD_HEIGHT=5
export BOARD_WIDTH=5
```
and then run the query bellow
```bigquery
ruby lib/robots_dilemma.rb
```
and in the command line just type your desired command like:
```bigquery
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```
and our robot moves on the board.

## Testing
### Unit tests
For each class there is a unit test which you should run separately like 
```
ruby test/robot_test.rb
ruby test/board_test.rb
```

### Integration

```bigquery
ruby test/operator_test.rb
```

