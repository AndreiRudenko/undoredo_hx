

class Main {
		
	static function main() {

		var undo_redo:UndoRedo = new UndoRedo(10);

		function add_cmd(_name:String) {
			
			var undo = function() {
				trace('undo: $_name');
			};

			var redo = function() {
				trace('redo: $_name');
			};

			undo_redo.add(new Command(undo, redo, _name));
		}

		add_cmd('cmd_1');
		add_cmd('cmd_2');
		trace(undo_redo);

		undo_redo.undo();
		undo_redo.redo();
		undo_redo.undo();
		add_cmd('cmd_3');
		trace(undo_redo);

	}

}
