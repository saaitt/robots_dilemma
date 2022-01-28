# RobotsDilemma
A robot who need instructions to walk on some board :D

## Installation
### Local
First you need to install ruby. Note that it's version should be higher than `` 2.4.0``

then run 
```bash
bundle install
```

### Docker
Build the image using the following command:
```bash
 docker build . -t robots_dilemma
```
And run it using 
```bash
 docker run -it --name robots_dilemma_instance robots_dilemma
```

## Usage
Set env variables for board dimensions(if not set, the default value is 5) 

```bash
export BOARD_HEIGHT=5
export BOARD_WIDTH=5
```
and then run the query bellow
```bash
ruby lib/robots_dilemma.rb
```
and in the command line just type your desired command like:
```bash
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
```bash
ruby test/robot_test.rb
ruby test/board_test.rb
```

### Integration

```bash
ruby test/operator_test.rb
```

