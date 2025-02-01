package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.ui.Mouse;
    import flash.ui.MouseCursor;
    import characters.Player;
    import gamestates.States;

    public class Game extends MovieClip {
        private var currentState:String;
        private var player:Player;
        public function Game() {
            trace("Menu Initialized");
            currentState = States.MENU;
            setupMenu();
        }

        private function switchState(newState:String):void {
            currentState = newState; // Update The Game State

            removeCurrentState();

            if(currentState == States.INSTRUCTIONS) {
                instructionState =  new InstructionsState(this);
                addChild(instructionsState);
            }
            else if (currentState == States.GAME){
                if (instrucitonState) {
                    instructionState.removeInstruction();
                }
                startGame();
            }
        }

        private function removeCurrentState():void {
            if (instructionState && contains(instructionState)) {
                removeChild(instructionState);
                instructionsState = null;
            }
        }

        private function removeMenu():void {
            // removeChild ActionScript 3 method removes object
            removeChild(play__btn);
            removeChild(options__btn);
            removeChild(exit__btn);
        }

        private function startGame():void {
            player = new Player();
            addChild(player);
        }

        private function setupMenu():void {
            trace("Setup Menu Called");

            // Add event listeners to the buttons
            play__btn.addEventListener(MouseEvent.CLICK, onPlayClick);
            options__btn.addEventListener(MouseEvent.CLICK, onOptionsClick);
            exit__btn.addEventListener(MouseEvent.CLICK, onExitClick);

            //Hover Effects
            play__btn.addEventListener(MouseEvent.MOUSE_OVER, onButtonHover);
            play__btn.addEventListener(MouseEvent.MOUSE_OUT, onButtonOut);

            options__btn.addEventListener(MouseEvent.MOUSE_OVER, onButtonHover);
            options__btn.addEventListener(MouseEvent.MOUSE_OUT, onButtonOut)

            exit__btn.addEventListener(MouseEvent.MOUSE_OVER, onButtonHover);
            exit__btn.addEventListener(MouseEvent.MOUSE_OUT, onButtonOut);
        }

        // Play Button Click

        private function onPlayClick(e:MouseEvent):void {
            trace("Switching to Game State ...");
            switchState(States.INSTRUCTIONS);

            //Transition to the INSTRUCTIONS state
        }

        // Option Button Click

        private function onOptionsClick(e:MouseEvent):void {
            trace("Option button clicked");

            // Transition to Options
        }

        private function onExitClick(e:MouseEvent):void {
            trace("Exit button clicked");

            stopAllMovieClips();
        }

        private function onButtonHover(e:MouseEvent):void {
            e.currentTarget.alpha = 0.6;
            Mouse.cursor = MouseCursor.BUTTON;
        }

        private function onButtonOut(e:MouseEvent):void {
            e.currentTarget.alpha = 1.0;
            Mouse.cursor = MouseCursor.ARROW;
        }

    }
}