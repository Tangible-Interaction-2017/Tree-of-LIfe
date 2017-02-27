public class WormView extends Animatable {
  private Direction _direction;
  private boolean _move;
  private boolean _reachedTree;
  
  WormView(int x, int y, Direction direction) {
    super(x, y, 89, 25);
    _direction = direction;
    _move = false;
    _reachedTree = false;
    
    if (direction == Direction.RIGHT) {
      String[] fileNames = {
        "images/worm_right_0.png", 
        "images/worm_right_1.png"
      };
      int[] indices = { 0, 1 };
      addFrameAnimation("move", fileNames, indices, 0.4);
    } else {
      String[] fileNames = {
        "images/worm_left_0.png", 
        "images/worm_left_1.png"
      };
      int[] indices = { 0, 1 };
      addFrameAnimation("move", fileNames, indices, 0.4);
    }
  }
  
  @Override
  void start(String id) {
    super.start(id);
    _move = id.equals("move");
  }
  
  @Override
  void stop() {
    super.stop();
    _move = false;
  }
  
  boolean reachedTree() {
    return _reachedTree;
  }
  
  void render() {
    super.render();
    
    if (!_reachedTree && _move) {    
      if (_direction == Direction.RIGHT) {
        if(getPosition().x>(width/2-getDimensions().x)){
          _reachedTree = true;
        }
        else{ 
        setPosition(getPosition().x+0.5, getPosition().y);
        }
    } else {
      if(getPosition().x<width/2){
          _reachedTree = true;
        } else {
        setPosition(getPosition().x-0.5, getPosition().y);
        }
      }
    }
  }
}

public enum Direction { LEFT, RIGHT }