package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.ui.Mouse;
    import flash.ui.MouseCursor;

    public class game extends MovieClip {
        public function game() {
            trace("Menu Initialized");

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
            trace("Play button clicked");

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