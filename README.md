# RobotsDilemma


## Installation
First you need to install ruby. Note that it's version should be higher than `` 2.4.0``

then run 
```bigquery
bundle install
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

## Testing
### Unit tests
For each class there is a unit test which you should run separately like 
```
ruby test/robot_test.rb
ruby test/board_test.rb
```

### Integration

```bigquery
ruby test/operator.rb
```

