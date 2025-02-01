
package characters{
    import flash.display.MovieClip
    import flash.events.KeyboardEvent;
    import flash.events.Event;

    public class Player extends MovieClip {
        private var speed:int = 2;

        private var movingLeft:Boolean = false;
        private var movingRight:Boolean = false;
        private var movingUp:Boolean = false;
        private var movingDown:Boolean = false;

        public function Player() {
            trace("Player Initialized");

            // Wait until the player is added to the stage before adding event listeners
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage(e:Event):void {
            // Listen for keyboard input
            stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
            stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);

            // Make sure player updates every frame
            addEventListener(Event.ENTER_FRAME, update);
        }

        private function update(e:Event):void {
            if (movingLeft) { // A
                this.x += speed;
            }
            if (movingRight) { // D
                this.x += speed;
            }
            if (movingUp) { // W
                this.x += speed;
            }
            if (movingDown) { // S
                this.x += speed;
            }
        }
                private function onKeyDown(e:KeyboardEvent):void {
            if (e.keyCode == 65) { // A
                movingLeft = true;
            }
            if (e.keyCode == 68) { // D
                movingRight = true;
            }
            if (e.keyCode == 87) { // W
                movingUp = true;
            }
            if (e.keyCode == 83) { // S
                movingDown = true;
            }
        }

        private function onKeyUp(e:KeyboardEvent):void {
            if (e.keyCode == 65) {
                movingLeft = false;
            }
            if (e.keyCode == 68) {
                movingRight = false;
            }
            if (e.keyCode == 87) {
                movingUp = false;
            }
            if (e.keyCode == 83) {
                movingDown = false;
            }
        }
    }
}