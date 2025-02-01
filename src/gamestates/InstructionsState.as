package gamestates {
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.events.MouseEvent;

    public class InstructionsState extends MovieClip {
        private var game:Game;
        private var instructionsText:TextField;

        public function InstructionsState(game:Game) {
            this.game = game;
            showInstructions();
        }

        private function showInstructions():void {
            trace("Instructions Screen Loaded");

            instructionsText = new TextField();
            instructionsText.text = "WASD - Move\nMouse - Aim\n Click to Start";        
            instructionsText.width = 400;
            instructionsText.height = 200;
            instructionsText.x = (stage.stageWidth - instructionsText.width) / 2;
            instrucitonsText.y = (stage.stageHeight - instructionsText.height) / 2;
            addChild(instructionsText);

            stage.addEventListener(MouseEvent.CLICK, onInstructionsClick);           
            }

            public function onInstrucitonsClick(e:MouseEvent):void {
                game.switchState(States.GAME);
            }

            public function removeInstrucitons():void {
                if (contains(instrucitonsText)) {
                    removeChild(instructionsText);
                }
                stage.removeEventListener(MouseEvent.CLICK, onInstructionsClick);
            }
    }
}