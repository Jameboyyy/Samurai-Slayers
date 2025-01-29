package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.ui.Mouse;
    import flash.ui.MouseCursor;

    public class game extends MovieClip {
        private var currentState:String;
        private var player:Player;
        public function game() {
            trace("Menu Initialized");
            currentState = gameState.MENU;
        }

        private function switchState(newState:String):void {
            currenState = newState; // Update The Game State

            if(current == gameState.GAME) {
                removeMenu();
                startGame();
            }
        }

        private function removeMenu(newState:String):void {
            // removeChild ActionScript 3 method removes object
            removeChild(play__btn);
            removeChild(option__btn);
            removeChild(exit__btn)
        }

        private function startGame():void {
            player = new Player();
            addChild(player);
        }

        private function setupMenu():void {

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
            switchState(gameState.GAME);

            //Transition to the gameplay state
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